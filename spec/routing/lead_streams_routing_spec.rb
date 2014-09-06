require "rails_helper"

RSpec.describe LeadStreamsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lead_streams").to route_to("lead_streams#index")
    end

    it "routes to #new" do
      expect(:get => "/lead_streams/new").to route_to("lead_streams#new")
    end

    it "routes to #show" do
      expect(:get => "/lead_streams/1").to route_to("lead_streams#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lead_streams/1/edit").to route_to("lead_streams#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lead_streams").to route_to("lead_streams#create")
    end

    it "routes to #update" do
      expect(:put => "/lead_streams/1").to route_to("lead_streams#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lead_streams/1").to route_to("lead_streams#destroy", :id => "1")
    end

  end
end
