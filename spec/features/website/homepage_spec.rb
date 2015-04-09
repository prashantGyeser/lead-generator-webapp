require 'rails_helper'

feature 'User visits their leads page' do

  scenario 'without leads available', js: true do
    visit  root_path
  end



end