require 'string_helper'
require 'rails_helper'

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

end