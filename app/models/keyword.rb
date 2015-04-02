# == Schema Information
#
# Table name: keywords
#
#  id                   :integer          not null, primary key
#  term                 :string(255)
#  lead_stream_id       :integer
#  created_at           :datetime
#  updated_at           :datetime
#  admin_created        :boolean
#  archived             :boolean          default(FALSE)
#  last_searched        :datetime
#  last_result_count    :integer
#  last_duplicate_count :integer
#  not_working          :boolean
#  last_run             :datetime
#

class Keyword < ActiveRecord::Base

  scope :active, -> { where(archived: false) }
  scope :no_search_in_24_hrs_or_never_searched,->  { where("last_searched < ? OR (last_searched IS NULL)", (DateTime.now - 24.hours)) }


  belongs_to :lead_stream
  has_many :unprocessed_tweets, dependent: :destroy
  has_many :leads, dependent: :destroy
  has_many :non_leads, dependent: :destroy

  def set_last_run
    self.last_run = DateTime.now
    self.save
  end

  def set_last_searched
    self.last_searched = DateTime.now
    self.save
  end
end
