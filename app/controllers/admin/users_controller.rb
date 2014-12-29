class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all
  end

  def all
    @users = User.all
  end

  def lead_stream
    if !params[:id].nil?
      @lead_stream = LeadStream.find(params[:id])
      @keywords = Keyword.where(lead_stream_id: @lead_stream.id)
      keyword_ids = []
      @keywords.each do |keyword|
        keyword_ids << keyword.id
      end

      @leads = Lead.where(keyword_id: keyword_ids)
      @user = User.find(@lead_stream.user_id)
    end
  end

  def keyword_tweets
    @unprocessed_tweets = UnprocessedTweet.where(keyword_id: params[:id]).where(processed: nil).first(50)
    @keyword = Keyword.find(params[:id])
  end

  def set_unprocessed_tweet_type

    unprocessed_tweet = UnprocessedTweet.find(params[:unprocessed_tweet_id])
    results = unprocessed_tweet.move_tweet(params[:is_lead])

    respond_to do |format|
      if !results.id.nil?
        #unprocessed_tweet[:processed] = true
        #unprocessed_tweet.save

        unprocessed_tweet.destroy

        format.json { render :json => results, status: :created }

      else
        puts "not created"
      end
    end

  end


  def new_keyword

    keyword = Keyword.new
    keyword.term = params[:term]
    keyword.lead_stream_id = params[:lead_stream_id]
    keyword.admin_created = true

    respond_to do |format|
      if keyword.save
        format.json { render :json => keyword, status: :created }
      else
        format.json { render :json => keyword.errors, status: 500 }
      end
    end

  end

  def set_sample_category
    sample_category = SampleCategory.find(params[:sample_category]["id"])
    user = User.find(params[:sample_category]["user_id"])

    puts "Okay irt is past finding the user"

    user.sample_category_id = sample_category.id

    puts "User: #{user.inspect}"

    respond_to do |format|
      if user.save
        format.json { render :json => user, status: :created }
      else
        puts user.inspect
        format.json { render :json => user.errors.messages, status: 500 }
      end
    end


  end


end
