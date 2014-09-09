require 'rails_helper'
require 'parse_and_store_leads'
require 'faker'

RSpec.describe ParseAndStoreLeads do

  before(:each) do

    @email = Faker::Internet.email

    @user = User.create(email: @email, password: 'password@123', password_confirmation: 'password@123' )

    @processor_lead = {
        "email"=>@email,
        "tweet_poster_screen_name"=>Faker::Internet.user_name(Faker::Name.name, %w(. _ -)),
        "tweet_body"=>Faker::Lorem.sentence,
        "user_location"=>"NYC",
        "city_latlon_generate_for"=>"NYC",
        "tweet_id"=>Faker::Lorem.word
    }
  end

  it "given a valid lead, it should store it" do
    results = ParseAndStoreLeads.save_lead(@processor_lead)
    expect(results).to eq true
  end


  it "should store a lead if is a datasift lead and does not contain an email" do
    city = City.create(name: "New York")
    category = Category.create(name: "Asian")
    processor_lead = {
        "tweet_poster_screen_name"=>Faker::Internet.user_name(Faker::Name.name, %w(. _ -)),
        "tweet_body"=>Faker::Lorem.sentence,
        "user_location"=>"NYC",
        "city_latlon_generate_for"=>"NYC",
        "tweet_id"=>Faker::Lorem.word,
        "category" => category.name,
        "city" => city.name,
    }

    results = ParseAndStoreLeads.save_lead(processor_lead)
    expect(results).to eq true

  end


end