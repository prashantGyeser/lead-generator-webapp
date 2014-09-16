require 'share_leads'
require 'rails_helper'

RSpec.describe ShareLeads do

  it "should store all the leads with the respective users" do
    user = User.create(email: "test@test.com", password: "password@123", password_confirmation: "password@123")
    lead_stream = LeadStream.create(user_id: user.id, category_id: 1, city_id: 1)

    lead = Lead.create(screen_name: Faker::Internet.user_name(Faker::Name.name , %w(. _ -)), tweet: Faker::Lorem.sentence, tweet_id: Faker::Lorem.characters(10), category_id: 1, city_id: 1)

    share_leads = ShareLeads.new
    share_leads.share_datsift_leads

    expect(UserLead.where(user_id: user.id).count).to eq 1

  end

  it "should not store a lead if it was created before a user signed up" do
    user = User.create(email: "test@test.com", password: "password@123", password_confirmation: "password@123")

    lead_stream = LeadStream.create(user_id: user.id, category_id: 1, city_id: 1)

    lead = Lead.create(screen_name: Faker::Internet.user_name(Faker::Name.name , %w(. _ -)), tweet: Faker::Lorem.sentence, tweet_id: Faker::Lorem.characters(10), category_id: 1, city_id: 1)

    lead.created_at = (DateTime.now - 20)
    lead.save

    share_leads = ShareLeads.new
    share_leads.share_datsift_leads

    expect(UserLead.where(user_id: user.id).count).to eq 0

  end

  it "should create a user leads when either a user id or lead id is unique in a lead stream" do
    user = User.create(email: "test@test.com", password: "password@123", password_confirmation: "password@123")
    lead_stream = LeadStream.create(user_id: user.id, category_id: 1, city_id: 1)

    lead = Lead.create(screen_name: Faker::Internet.user_name(Faker::Name.name , %w(. _ -)), tweet: Faker::Lorem.sentence, tweet_id: Faker::Lorem.characters(10), category_id: 1, city_id: 1)
    lead_2 = Lead.create(screen_name: Faker::Internet.user_name(Faker::Name.name , %w(. _ -)), tweet: Faker::Lorem.sentence, tweet_id: Faker::Lorem.characters(10), category_id: 1, city_id: 1)

    lead.created_at = (DateTime.now + 20)
    lead.save
    lead_2.created_at = (DateTime.now + 20)
    lead_2.save

    share_leads = ShareLeads.new
    share_leads.share_datsift_leads

    expect(UserLead.where(user_id: user.id).count).to eq 2
  end


  it "should only return leads created after the user sign up date" do

    user = User.create(email: "test@test.com", password: "password@123", password_confirmation: "password@123")

    lead = Lead.create(screen_name: Faker::Internet.user_name(Faker::Name.name , %w(. _ -)), tweet: Faker::Lorem.sentence, tweet_id: Faker::Lorem.characters(10), category_id: 1, city_id: 1)

    results = ShareLeads.lead_created_after_sign_up?(lead.created_at, user.created_at)

    expect(results).to eq true
  end

  it "should only return leads created after the user sign up date" do

    user = User.create(email: "test@test.com", password: "password@123", password_confirmation: "password@123")

    results = ShareLeads.lead_created_after_sign_up?((DateTime.now - 10), user.created_at)

    expect(results).to eq false
  end

end