require 'rails_helper'

RSpec.describe UserGuidesController, :type => :controller do

  describe "GET keywords" do
    it "returns http success" do
      get :keywords
      expect(response).to be_success
    end
  end

  describe "GET replies" do
    it "returns http success" do
      get :replies
      expect(response).to be_success
    end
  end

end
