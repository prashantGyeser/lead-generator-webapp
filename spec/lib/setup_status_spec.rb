require 'rails_helper'
require 'setup_status'

RSpec.describe SetupStatus do

  before(:each) do
    @user = User.create(email: 'rspec@test.com', password: 'password@123', password_confirmation: 'password@123')
  end

  it "should return true when the user has finished the setup" do
    lead_stream = LeadStream.create(user_id: @user.id)
    token = Token.create(user_id: @user.id)
    expect(SetupStatus.setup_complete?(@user.id)).to eq true
  end

  it "should return false when a user has not setup a stream" do
    expect(SetupStatus.setup_complete?(@user.id)).to eq false
  end

  it "should return false when a user has not integrated Twiter" do
    lead_stream = LeadStream.create(user_id: @user.id)
    expect(SetupStatus.setup_complete?(@user.id)).to eq false
  end

  it "should return true if the user has a lead_stream" do
    lead_stream = LeadStream.create(user_id: @user.id)
    expect(SetupStatus.lead_stream_created?(@user.id)).to eq true
  end

end