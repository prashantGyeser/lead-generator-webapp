require 'rails_helper'
include Warden::Test::Helpers

feature 'User on trial logs in' do

  scenario 'for the first time'do
    user = FactoryGirl.create(:user)
    login_as user, :scope => :user

    visit  dashboard_root_path
    expect(page).to have_content "1. Keyword Setup"
  end

  scenario 'with trial active after setting up the first lead stream' do

    user = FactoryGirl.create(:user, email: Faker::Internet.email)
    login_as user, :scope => :user

    lead_stream = FactoryGirl.create(:lead_stream, user_id: user.id)

    visit dashboard_root_path
    expect(page).to have_content "Connect your Twitter account"
  end

  scenario 'with trial active after setting up the first lead stream'do

    user = FactoryGirl.create(:user, email: Faker::Internet.email)
    login_as user, :scope => :user

    lead_stream = FactoryGirl.create(:lead_stream, user_id: user.id)
    token = FactoryGirl.create(:token, user_id: user.id)

    visit  dashboard_root_path
    expect(page).to have_content "7 days remaining"
  end

  scenario 'after trial expires' do

    user = FactoryGirl.create(:user, email: Faker::Internet.email)
    login_as user, :scope => :user

    user.invitation_accepted_at = (user.created_at + (user.trial_duration - 15).days)

    user.save

    lead_stream = FactoryGirl.create(:lead_stream, user_id: user.id)
    token = FactoryGirl.create(:token, user_id: user.id)

    visit  dashboard_root_path
    expect(page).to have_content "Trail Expired"
  end


  #, js: true

end