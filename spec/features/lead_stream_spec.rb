require 'rails_helper'
include Warden::Test::Helpers

feature 'User visits their lead stream dashboard' do

  scenario 'for the first time'do
    user = FactoryGirl.create(:user)
    login_as user, :scope => :user

    visit  dashboard_root_path
    expect(page).to have_content "1. Keyword Setup"
  end

  #, js: true

end