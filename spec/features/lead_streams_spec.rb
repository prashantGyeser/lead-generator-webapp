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
    visit  dashboard_root_path
    #expect(page).to have_content @keyword.term
    expect(page).to have_content @keyword.term
  end

  #scenario 'and wants to edit their keywords', js: true do


    #click_button "Edit Keywords"

    #expect(page).to have_selector('div.modal-body', text: /#{@keyword.term}/i)
    #expect(page).to have_content "Delete"

  #end

  scenario 'and wants to edit their keywords', js: true do
    visit  dashboard_root_path

    click_button "Edit Keywords"

    expect(page).to have_selector('div.modal-body', text: /#{@keyword.term}/i)
    expect(page).to have_content "Delete"
  end

  scenario 'and wants to delete a keyword', js: true do

    visit  dashboard_root_path
    click_button "Edit Keywords"

    # Todo: Figure out why this needs to be added before the click link action. Capybara is not doing it automatically
    # Todo: If this call is not there the click link fails
    # Todo: Right now this expect is as good as a sleep function it is just there to wait
    expect(page).to have_content "Delete"
    click_link 'Delete'

    expect(page).not_to have_selector('div.modal-body', text: /#{@keyword.term}/i)
    expect(page).to have_content "Add Keyword"

  end

  scenario 'and wants to add a keyword when he has less than 3 keywords', js: true do

    visit  dashboard_root_path
    click_button "Edit Keywords"

    fill_in "keyword_term", with: "hello"
    click_button "Add Keyword"

    expect(page).not_to have_selector('.keyword_table td', text: "hello")

  end

  scenario 'and wants to add a keyword when he has 3 keywords', js: true do

    keyword_2 = FactoryGirl.create(:keyword, lead_stream_id: @lead_stream.id)
    keyword_3 = FactoryGirl.create(:keyword, lead_stream_id: @lead_stream.id)

    visit dashboard_root_path
    click_button "Edit Keywords"

    expect(page).not_to have_content "Add Keyword"

  end



end