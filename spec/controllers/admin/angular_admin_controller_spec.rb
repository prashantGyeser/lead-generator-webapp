require 'rails_helper'

RSpec.describe Admin::AngularAdminController, :type => :controller do

  describe "GET users" do
    it "returns http success" do
      get :users
      expect(response).to be_success
    end
  end

  describe "GET keywords" do
    it "returns http success" do
      get :keywords
      expect(response).to be_success
    end
  end

end
