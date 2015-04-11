require 'beta_feature_helper'
require 'rails_helper'

RSpec.describe BetaFeatureHelper do

  before(:each) do
    @beta_feature_helper = BetaFeatureHelper.new
  end

  it "should detect the lead posters gender given a name" do

    FactoryGirl.create(:lead, poster_name: "Bob")

    @beta_feature_helper.set_gender_for_leads

    expect(Lead.last.gender).to eq "male"

  end




end