# == Schema Information
#
# Table name: tweet_replies
#
#  id         :integer          not null, primary key
#  lead_id    :integer
#  message    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  token_id   :integer
#  tweet_id   :string(255)
#

class TweetReply < ActiveRecord::Base
  belongs_to :user
  validates_length_of :message, :minimum => 10, :maximum => 140, :allow_blank => false

  has_many :links

  def shorten_links
    shortened_url_container =  LinkManager.new(self.message).shorten_all_urls
    store_urls(shortened_url_container[:url_details])
    update_shortened_urls(shortened_url_container)
    send_reply
  end

  def store_urls(links)
    StoreShortenedLinks.new(links, self.id).store_links
  end

  def update_shortened_urls(shortened_url_container)
    self.message = shortened_url_container[:text_with_shortened_links]
  end

  def send_reply
    #Todo
  end



end
