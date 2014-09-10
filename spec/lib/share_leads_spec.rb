require 'share_leads'
require 'rails_helper'

RSpec.describe ShareLeads do

  it "should store all the leads with the respective users" do
    lead_stream = LeadStream.create(user_id: 1, category_id: 1, city_id: 1)

    lead = Lead.create(screen_name: Faker::Internet.user_name(Faker::Name.name , %w(. _ -)), tweet: Faker::Lorem.sentence, tweet_id: Faker::Lorem.characters(10), category_id: 1, city_id: 1)

    share_leads = ShareLeads.new
    share_leads.share_datsift_leads

    expect(UserLead.count).to eq 1

  end

end