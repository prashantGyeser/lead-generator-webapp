require 'string_helper'

RSpec.describe StringHelper do


  it "should return an array of words given a valid string with space delimters" do
    expect(StringHelper.split_into_word_array("A Test")).to eq ['A', 'Test']
  end

  it "should split a string with a non space delimeter in a word array" do
    expect(StringHelper.split_into_word_array("A-Test")).to eq ['A', 'Test']
  end

  it "should return a signle word if the string only has one word" do
    expect(StringHelper.split_into_word_array("Test")).to eq ['Test']
  end

  it "should return true if some of the words exist in the second array" do
    expect(StringHelper.elements_exist_in_second_array?(["hello", "welcome"], ["hello", "goodbye", "orange"])).to eq true
  end

  it "should return true if all the words exist in the second array" do
    expect(StringHelper.elements_exist_in_second_array?(["hello", "welcome"], ["hello", "welcome"])).to eq true
  end

  it "should return false if none of the words exist in the second array" do
    expect(StringHelper.elements_exist_in_second_array?(["hello", "welcome"], ["test", "test2"])).to eq false
  end

  it "should return true if the first string contains the second string" do
    expect(StringHelper.contains_string?("New York", "New")).to eq true
  end

end