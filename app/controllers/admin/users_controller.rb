class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all
  end

  def all
    @users = User.all
  end

  def lead_stream

  end

  def keyword_tweets
    @unprocessed_tweets = UnprocessedTweet.first(50)
  end

  def set_unprocessed_tweet_type

    unprocessed_tweet = UnprocessedTweet.find(params[:unprocessed_tweet_id])
    results = unprocessed_tweet.move_tweet(params[:is_lead])

    respond_to do |format|
      if !results.id.nil?
        unprocessed_tweet[:processed] = true
        unprocessed_tweet.save

        format.json { render :json => results, status: :created }

      else
        puts "not created"
      end
    end




    #phone_item = Phone.find(x)   # Get the phone item you want to copy
    # you may have obtained this some other way

    #PhoneTemp.create(phone_item.attributes).save if phone_item

  end

end
