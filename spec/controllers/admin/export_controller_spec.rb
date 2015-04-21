require 'rails_helper'

RSpec.describe Admin::ExportController, :type => :controller do

  describe "GET leads" do
    it "returns http success" do
      get :leads
      expect(response).to be_success
    end
  end

  describe "GET non_leads" do
    it "returns http success" do
      get :non_leads
      expect(response).to be_success
    end
  end

  describe "GET unprocessed_leads" do
    it "returns http success" do
      get :unprocessed_leads
      expect(response).to be_success
    end
  end

end
