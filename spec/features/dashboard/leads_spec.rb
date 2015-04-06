require 'rails_helper'
include Warden::Test::Helpers

feature 'User visits their leads page' do

  background do
    @user = FactoryGirl.create(:user)
    @lead_stream = FactoryGirl.create(:lead_stream, user_id: @user.id)
    @token = FactoryGirl.create(:token, user_id: @user.id)
    @keyword = FactoryGirl.create(:keyword, lead_stream_id: @lead_stream.id)

    login_as @user, :scope => :user

  end

  scenario 'without leads available' do
    visit  "/dashboard/leads/#{@lead_stream.id}"
    expect(page).to have_content "No Leads Yet!"
  end


  scenario 'with leads available' do

    lead = FactoryGirl.create(:lead, keyword_id: @keyword.id)
    visit  "/dashboard/leads/#{@lead_stream.id}"

    expect(page).not_to have_content "No Leads Yet!"
    expect(page).to have_content lead.tweet_body


  end


  scenario 'and wants to send a reply to one of the leads',js: true do

    lead = FactoryGirl.create(:lead, keyword_id: @keyword.id)
    visit  "/dashboard/leads/#{@lead_stream.id}"

    find(".reply_btn").click

    expect(page).to have_content "Send Message"



  end

end