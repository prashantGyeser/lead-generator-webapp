# == Schema Information
#
# Table name: links
#
#  id             :integer          not null, primary key
#  in_url         :string(255)
#  out_url        :text
#  http_status    :integer          default(301)
#  created_at     :datetime
#  updated_at     :datetime
#  tweet_reply_id :integer
#  views          :integer
#

class Link < ActiveRecord::Base
  belongs_to :tweet_reply

  def self.increment_views
    self.views = self.views + 1
    self.save
  end
end
