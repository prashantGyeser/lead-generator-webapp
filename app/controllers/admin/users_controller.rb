class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all
  end

  def all
    @users = User.all
  end

  def lead_stream
    if !params[:id].nil?
      lead_stream = LeadStream.find(params[:id])
      keywords = Keyword.where(lead_stream_id: lead_stream.id)
      keyword_ids = []
      keywords.each do |keyword|
        keyword_ids << keyword.id
      end

      @leads = Lead.where(keyword_id: keyword_ids)
      @user = User.find(lead_stream.user_id)
    end
  end

  def keyword_tweets
    @unprocessed_tweets = UnprocessedTweet.where(keyword_id: params[:id]).where(processed: nil).first(50)
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
