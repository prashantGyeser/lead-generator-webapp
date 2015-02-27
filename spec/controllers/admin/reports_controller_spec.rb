require 'rails_helper'

RSpec.describe Admin::ReportsController, :type => :controller do

  describe "GET unprocessed_tweets" do
    it "returns http success" do
      get :unprocessed_tweets
      expect(response).to be_success
    end
  end

end
