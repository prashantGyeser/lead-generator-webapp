class RemoveDuplicates

  def unprocessed_tweets

    UnprocessedTweet.find_each do |unprocessed_tweet|

      if unprocessed_tweet.tweet_id.nil?
        unprocessed_tweet.processed = true
        unprocessed_tweet.save

        puts "Removed unprocessed_tweet with no id: #{unprocessed_tweet.id}"

      else
        lead_count = Lead.where(tweet_id: unprocessed_tweet.tweet_id).count
        non_lead_count = NonLead.where(tweet_id: unprocessed_tweet.tweet_id).count

        if lead_count > 0 || non_lead_count > 0
          unprocessed_tweet.processed=true
          unprocessed_tweet.save

          puts "Removed unprocessed_tweet: #{unprocessed_tweet.id}"

        end

      end

    end

  end


  def set_tweet_id_for_replies
    tweet_replies = TweetReply.all

    tweet_replies.each do |tweet_reply|
      lead = Lead.find(tweet_reply.lead_id)

      tweet_reply.tweet_id = lead.tweet_id
      tweet_reply.save

    end

  end


end