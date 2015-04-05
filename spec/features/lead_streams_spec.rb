require 'rails_helper'
include Warden::Test::Helpers

feature 'User visits their lead stream dashboard' do

  background do
    @user = FactoryGirl.create(:user)
    @lead_stream = FactoryGirl.create(:lead_stream, user_id: @user.id)
    @token = FactoryGirl.create(:token, user_id: @user.id)
    @keyword = FactoryGirl.create(:keyword, lead_stream_id: @lead_stream.id)

    login_as @user, :scope => :user

  end

  scenario 'for the first time' do

    visit  dashboard_root_path
    expect(page).to have_content "Thanks for signing up for Urbanzeak. It will take a few hours for your leads to begin showing up. We will send you can email as soon as we find your leads."

  end

  scenario 'with keywords setup' do
    #expect(page).to have_content @keyword.term
    visit  dashboard_root_path
    expect(page).to have_content @keyword.term
  end

  scenario 'and wants to edit their keywords', js: true do

    visit  dashboard_root_path
    click_button "Edit Keywords"

  end


end