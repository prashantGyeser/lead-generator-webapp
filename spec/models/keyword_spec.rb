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

require 'rails_helper'

RSpec.describe Keyword, :type => :model do

  it "should return true if a keyword is active and never searched" do
    keyword = FactoryGirl.create(:keyword)
    expect(keyword.is_active_no_search_24_hrs?).to eq true
  end

  it "should return true if a keyword is active and not searched in the last 24 hours" do
    keyword = FactoryGirl.create(:keyword, last_searched: (DateTime.now - 25.hours))
    expect(keyword.is_active_no_search_24_hrs?).to eq true
  end

  it "should return false if a keyword is active and searched in the last 24 hours" do
    keyword = FactoryGirl.create(:keyword, last_searched: (DateTime.now - 23.hours))
    expect(keyword.is_active_no_search_24_hrs?).to eq false
  end

end