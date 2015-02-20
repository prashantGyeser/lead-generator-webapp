require 'rails_helper'

RSpec.describe Admin::ExportController, :type => :controller do

  describe "GET leads" do
    it "returns http success" do
      get :leads
      expect(response).to be_success
    end
  end

end
