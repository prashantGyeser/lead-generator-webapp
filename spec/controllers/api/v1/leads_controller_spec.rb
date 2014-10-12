require 'rails_helper'

RSpec.describe Api::V1::LeadsController, :type => :controller do

  describe "GET batch_create" do
    it "returns http success" do
      get :batch_create
      expect(response).to be_success
    end
  end

end
