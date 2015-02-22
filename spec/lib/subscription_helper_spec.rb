require 'subscription_helper'
require 'rails_helper'

RSpec.describe SubscriptionHelper do

  it "should return the number of days a user has remaining on trial" do
    user = FactoryGirl.create(:user)
    subscription_helper = SubscriptionHelper.new
    expect(subscription_helper.remaining_days(user)).to eq 8
  end

  it "should return a negative number in case trial is over" do
    user = FactoryGirl.create(:user, trial_duration: -20)
    subscription_helper = SubscriptionHelper.new
    expect(subscription_helper.remaining_days(user)).to eq -19
  end

  it "should return true if trial days still remain" do
    user = FactoryGirl.create(:user)
    subscription_helper = SubscriptionHelper.new
    expect(subscription_helper.trial_active?(user)).to eq true
  end

  it "should return false if trial days still remain" do
    user = FactoryGirl.create(:user, trial_duration: -20)
    subscription_helper = SubscriptionHelper.new
    expect(subscription_helper.trial_active?(user)).to eq false
  end

  it "should return true in case a user is subscribed" do
    user = FactoryGirl.create(:user)
    Subscription.create(plan_code: "basic", account_code: "basic", user_id: user.id)
    subscription_helper = SubscriptionHelper.new
    expect(subscription_helper.is_subscribed?(user)).to eq true
  end

  it "should return false in case a user is subscribed" do
    user = FactoryGirl.create(:user)
    subscription_helper = SubscriptionHelper.new
    expect(subscription_helper.is_subscribed?(user)).to eq false
  end


end