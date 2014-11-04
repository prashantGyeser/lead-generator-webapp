require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

  describe "GET restaurants" do
    it "returns http success" do
      get :restaurants
      expect(response).to be_success
    end
  end

end
