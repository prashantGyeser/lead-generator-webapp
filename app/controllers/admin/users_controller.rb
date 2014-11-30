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

  end

end
