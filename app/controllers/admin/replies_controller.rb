class Admin::RepliesController < Admin::ApplicationController
  def index
    @tweet_replies = TweetReply.all
  end
end
