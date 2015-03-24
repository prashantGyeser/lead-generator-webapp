# == Schema Information
#
# Table name: users
#
#  id                           :integer          not null, primary key
#  email                        :string(255)      default(""), not null
#  encrypted_password           :string(255)      default("")
#  reset_password_token         :string(255)
#  reset_password_sent_at       :datetime
#  remember_created_at          :datetime
#  sign_in_count                :integer          default(0), not null
#  current_sign_in_at           :datetime
#  last_sign_in_at              :datetime
#  current_sign_in_ip           :string(255)
#  last_sign_in_ip              :string(255)
#  created_at                   :datetime
#  updated_at                   :datetime
#  authorized_application       :boolean
#  user_sent_to_processor       :boolean
#  total_streams                :integer          default(1)
#  setup_complete               :boolean
#  trial_duration               :integer          default(7)
#  invitation_token             :string(255)
#  invitation_created_at        :datetime
#  invitation_sent_at           :datetime
#  invitation_accepted_at       :datetime
#  invitation_limit             :integer
#  invited_by_id                :integer
#  invited_by_type              :string(255)
#  invitations_count            :integer          default(0)
#  sample_category_id           :integer
#  new_user                     :boolean          default(TRUE)
#  admin                        :boolean
#  is_active                    :boolean          default(TRUE)
#  subscribed                   :boolean          default(FALSE)
#  website                      :string(255)
#  founder_welcome_sent         :boolean          default(FALSE)
#  trial_over_notification_sent :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe User, :type => :model do

  it "should set a default value for the trail period field" do
    expect(FactoryGirl.create(:user).trial_duration).to eq 7
  end

  it "should set a default value for the trail period field" do
    expect(FactoryGirl.create(:user).total_streams).to eq 1
  end

  it "should set a default value for the trail period field" do
    expect(FactoryGirl.create(:user).new_user).to eq true
  end

  it "should return the domain of the users email" do
    user = FactoryGirl.create(:user, email: 'test@test.com')
    expect(user.email_domain).to eq "test.com"
  end

  it "should return the domain of the users email even in special cases" do
    user = FactoryGirl.create(:user, email: 'test-test@test.com.co')
    expect(user.email_domain).to eq "test.com.co"
  end

  it "should return true if a generic domain is used" do
    user = FactoryGirl.create(:user, email: 'test@yahoo.com')
    expect(user.is_generic_email?).to eq true
  end

  it "should return false if a nongeneric domain is used" do
    user = FactoryGirl.create(:user, email: 'test@urbanzeak.com')
    expect(user.is_generic_email?).to eq false
  end

  it "should create a new generic email domain notification if a user is using gmail or other free providers" do
    user = FactoryGirl.create(:user, email: 'test@gmail.com')
    user.generic_email_domain_check
    expect(Notification.last.user_id == user.id).to eq true
  end

end
