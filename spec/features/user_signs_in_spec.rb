require 'rails_helper'

feature 'User logs in' do

  let!(:user) { FactoryGirl.create(:user) }

  scenario 'with valid credentials for the first time' do
    visit  new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
    expect(page).to have_content "1. Keyword Setup"
  end

  scenario 'with valid credentials after keyword setup' do
    lead_stream = FactoryGirl.create(:lead_stream, user_id: user.id)

    visit  new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
    expect(page).to have_content "Connect your Twitter account"
  end

  scenario 'with valid credentials setup' do
    lead_stream = FactoryGirl.create(:lead_stream, user_id: user.id)
    token = FactoryGirl.create(:token, user_id: user.id)

    visit  new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
    expect(page).to have_content "Logout"
  end



end