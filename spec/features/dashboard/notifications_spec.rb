require 'rails_helper'
include Warden::Test::Helpers

feature 'User receives a notification' do

  background do
    @user = FactoryGirl.create(:user, email: "test@yahoo.com")
    FactoryGirl.create(:lead_stream, user_id: @user.id)
    FactoryGirl.create(:token, user_id: @user.id)

    login_as @user, :scope => :user
  end

  scenario 'when their website cannot be extracted from their email', js: true do

    visit  dashboard_root_path
    click_link "my-task-list"
    expect(page).to have_content "We could not determine your website from your email"

    find(".set_website", :visible => true).click

    within("#form_traditional_validation") do

      fill_in("websiteUrl", with: 'http://www.yahoo.com')
      #find(".modal-footer .btn-primary", :visible => true).click
      click_button("Save Website")

    end

    expect(page).to have_content "Success: Added your website."


  end


end