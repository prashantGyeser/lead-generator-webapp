require 'rails_helper'

RSpec.describe Admin::TempProcessedTweetsController, :type => :controller do

  describe "GET temp_leads" do
    it "returns http success" do
      get :temp_leads
      expect(response).to be_success
    end
  end

  describe "GET temp_non_leads" do
    it "returns http success" do
      get :temp_non_leads
      expect(response).to be_success
    end
  end

end
