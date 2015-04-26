
class Classifier


  def bayesian_for_user(user_id)

    puts "It is getting here: #{user_id}"

    user = User.find(user_id)
    user_keyword_ids = user.get_keyword_ids

    leads = Lead.where(keyword_id: user_keyword_ids)
    non_leads = NonLead.where(keyword_id: user_keyword_ids)
    unprocessed_tweets = UnprocessedTweet.where(keyword_id: user_keyword_ids).where(processed: nil)


    bayes_classifier = initialize_bayes_classifier

    bayes_classifier = train_bayesian(bayes_classifier, :lead, leads)
    bayes_classifier = train_bayesian(bayes_classifier, :non_lead, non_leads)

    puts "Just before the classification"

    unprocessed_tweets.find_each do |unprocessed_tweet|
      result = bayesian_classifier(bayes_classifier, unprocessed_tweet.tweet_body)

      puts "The result is: #{result}"

      if result == :lead
        puts "It is getting into the true part"
        unprocessed_tweet.move_tweet_temp(true)
      else
        unprocessed_tweet.move_tweet_temp(false)
      end

    end

    puts "Classification done"

  end


  private
  # At this time the initializer assumes there are only two categories
  # Lead OR Non Lead
  def initialize_bayes_classifier
    StuffClassifier::Bayes.new("Lead or NonLead")
  end

  def train_bayesian(classifier, category_symbol, training_data)
    training_data.find_each do |training_record|
      classifier.train(category_symbol, training_record.tweet_body)
    end

    return classifier

  end

  def bayesian_classifier(classifier, data_to_classify)
    classifier.classify(data_to_classify)
  end

end