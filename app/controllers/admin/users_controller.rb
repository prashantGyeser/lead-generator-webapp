require 'subscription_helper'

class Admin::UsersController < Admin::ApplicationController
  def index
    #@users = User.active
    @subscription_helper = SubscriptionHelper.new

    # Including the leads streams and keywords for the user in the query
    @users = User.where(on_trial_or_subscribed: true).order('created_at DESC').includes(:lead_streams).paginate(page: params[:page], per_page: 3exit
    )
  end

  def active
    #@users = User.where('created_at < ?', (Date.today - this.trial_duration))
  end

  def deactive

  end

  def no_leads

  end

  def all
    @users = User.all.paginate(page: params[:page], per_page: 10).order('created_at DESC')
    @subscription_helper = SubscriptionHelper.new
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
        unprocessed_tweet[:processed] = true
        unprocessed_tweet.save

        format.json { render :json => results, status: :created }

      else
        unprocessed_tweet[:processed] = true
        unprocessed_tweet.save

        format.json { render :json => results, status: :created }
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


  def set_not_working_keyword
    keyword = Keyword.find(params[:keyword_id])

    keyword.not_working = true

    respond_to do |format|
      if keyword.save
        format.json { render :json => keyword, status: :created }
      else
        puts keyword.inspect
        format.json { render :json => keyword.errors.messages, status: 500 }
      end
    end

  end


end
