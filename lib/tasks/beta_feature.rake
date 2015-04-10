require 'beta_feature_helper'

namespace :beta_feature do

  desc "Search every keyword that has not been used to search in the last 24 hours"
  task detect_gender: :environment do
    beta_feature_helper = BetaFeatureHelper.new
    beta_feature_helper.set_gender_for_leads
  end

end