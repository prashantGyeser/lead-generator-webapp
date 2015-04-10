require 'rails_helper'

feature 'User visits the homepage' do

  scenario 'and leaves a valid email address', js: true do
    visit  root_path

    within '#signup-divider' do
      fill_in "signup-email", with: "test@test.com"
      click_button "Join Today"
    end

    expect(page).to have_content "Do you want to start finding leads faster? Share us on Twitter and we will send you an invite in the next 24 hours!"

    expect(page).to have_button('Join Today', disabled: true)

  end

  scenario 'leaves an email address twice', js: true do

    email_left = EmailLeft.create(email: 'test@test.com')

    visit  root_path

    within '#signup-divider' do
      fill_in "signup-email", with: email_left.email
      click_button "Join Today"
    end

    expect(page).to have_button('Join Today', disabled: false)
    expect(page).to have_content 'Something went wrong!'
    expect(page).to have_content 'Email has already been taken'


  end

  scenario 'and leaves a valid email he should be invited immediately' # Todo: Start testing mailers





end