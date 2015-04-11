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


  scenario 'and has the gender beta feature enabled' do

    @user.active_beta_feature = 'gender'
    @user.save

    lead = FactoryGirl.create(:lead, keyword_id: @keyword.id, gender: 'female')

    visit "/dashboard/leads/#{@lead_stream.id}"

    expect(page).to have_css('i.fa-venus')

  end


  scenario 'and does not have the gender beta feature enabled' do

    lead = FactoryGirl.create(:lead, keyword_id: @keyword.id, gender: 'male')

    visit "/dashboard/leads/#{@lead_stream.id}"

    expect(page).not_to have_css('i.fa-mars-stroke')

  end


  scenario 'and has the export beta feature enabled' do

    @user.active_beta_feature = 'export'
    @user.save

    lead = FactoryGirl.create(:lead, keyword_id: @keyword.id)

    visit "/dashboard/leads/#{@lead_stream.id}"

    expect(page).to have_content "Export All Leads To CSV"

    click_link "Export All Leads To CSV"

    expect(page.response_headers['Content-Type']).to eq "application/octet-stream"


  end


  scenario 'and has the export beta feature enabled' do

    lead = FactoryGirl.create(:lead, keyword_id: @keyword.id)

    visit "/dashboard/leads/#{@lead_stream.id}"

    expect(page).not_to have_content "Export All Leads To CSV"


  end



end



