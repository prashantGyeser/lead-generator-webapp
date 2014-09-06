require 'rails_helper'

RSpec.describe "LeadStreams", :type => :request do
  describe "GET /lead_streams" do
    it "works! (now write some real specs)" do
      get lead_streams_path
      expect(response.status).to be(200)
    end
  end
end
