require 'rails_helper'
require 'set_priority'
require 'faker'

RSpec.describe SetPriority do

  it "should return true given a tweet with a keyword" do
    expect(SetPriority.contains_keyword?("I am craving pizza")).to eq true
  end

  it "should return false given a tweet without a keyword" do
    expect(SetPriority.contains_keyword?("I am love pizza")).to eq false
  end

  it "should set the priority of a lead to high if it contains a keyword" do
    Lead.create(tweet: "I am craving pizza", tweet_id: Faker::Lorem.characters(10))
    set_priority = SetPriority.new
    set_priority.all_leads
    lead = Lead.last
    expect(lead.priority).to eq "high"
  end

  it "should set the priority of a lead to low if it does not contains a keyword" do
    Lead.create(tweet: "I am lo ve pizza", tweet_id: Faker::Lorem.characters(10))
    set_priority = SetPriority.new
    set_priority.all_leads
    lead = Lead.last
    expect(lead.priority).to eq "low"
  end

end