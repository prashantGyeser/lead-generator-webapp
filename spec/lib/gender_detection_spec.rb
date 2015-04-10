require 'rails_helper'
require 'gender_detection'
require 'faker'

RSpec.describe GenderDetection do

  before(:each) do
    @gender_detection = GenderDetection.new
  end


  it "should return true if the word has a whitepace and false if no whitespace is there in the phrase" do
    expect(@gender_detection.has_whitespace?("test name")).to eq true
    expect(@gender_detection.has_whitespace?("testname")).to eq false
  end


  it "should return the first name if the name has two words" do
    expect(@gender_detection.first_name("test name")).to eq "test"
  end


  it "should detect the gender given a valid first name" do
    expect(@gender_detection.gender("Bob")).to eq :male
  end


end