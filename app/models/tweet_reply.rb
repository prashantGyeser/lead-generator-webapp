# == Schema Information
#
# Table name: tweet_replies
#
#  id              :integer          not null, primary key
#  lead_id         :integer
#  message         :string(255)
#  user_id         :integer
#  created_at      :datetime
#  updated_at      :datetime
#  token_id        :integer
#  tweet_id        :string(255)
#  retweet_count   :integer
#  favorites_count :integer
#  reply_tweet_id  :string(255)
#

class TweetReply < ActiveRecord::Base
  belongs_to :user
  validates_length_of :message, :minimum => 10, :maximum => 140, :allow_blank => false

  has_many :links

  before_create :append_screen_name
  before_create :set_token
  before_create :set_tweet_id
  after_create :shorten_links

  def append_screen_name
    lead = Lead.find(self.lead_id)
    self.message = "@#{lead.poster_screen_name}" + self.message
  end

  def set_token
    token = Token.where(:user_id => self.user_id).last
    self.token_id = token.id
  end

  def set_tweet_id
    self.tweet_id = Lead.find(self.lead_id).tweet_id
  end

  def shorten_links
    shortened_url_container =  LinkManager.new(self.message).shorten_all_urls
    store_urls(shortened_url_container[:url_details])
    update_shortened_urls(shortened_url_container)
    twitter_reply = send_reply
    set_reply_tweet_id(twitter_reply, self)
  end

  def store_urls(links)
    StoreShortenedLinks.new(links, self.id).store_links
  end

  def update_shortened_urls(shortened_url_container)
    self.message = shortened_url_container[:text_with_shortened_links]
    self.save
  end

  def send_reply
    TwitterReply.new(self.message, Token.find(token_id), Lead.find(self.lead_id).tweet_id).send_reply
  end

  def set_reply_tweet_id(tweet, tweet_reply)
    tweet_reply.reply_tweet_id = tweet.id
  end

end
