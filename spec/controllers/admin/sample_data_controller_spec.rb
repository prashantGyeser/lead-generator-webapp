require 'rails_helper'

RSpec.describe Admin::SampleDataController, :type => :controller do

  describe "GET categories" do
    it "returns http success" do
      get :categories
      expect(response).to be_success
    end
  end

  describe "GET tweets" do
    it "returns http success" do
      get :tweets
      expect(response).to be_success
    end
  end

end
