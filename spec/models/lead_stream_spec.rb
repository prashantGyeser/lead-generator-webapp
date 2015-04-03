# == Schema Information
#
# Table name: lead_streams
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  category_id   :integer
#  city_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#  city_name     :string(255)
#  latitude      :float
#  longitude     :float
#  name          :string(255)
#  email_left_id :integer
#

require 'rails_helper'

RSpec.describe LeadStream, :type => :model do

  it "should not allow a user to create more than the allowed lead streams" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:lead_stream, user_id: user.id)
    expect(FactoryGirl.build(:lead_stream, user_id: user.id)).not_to be_valid
  end

end
