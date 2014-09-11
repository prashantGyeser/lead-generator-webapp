require 'rails_helper'
require 'report_data'

RSpec.describe ReportData do

  it "should return the total number of tweets for a users categories for the past 7 days" do

    category = Category.create(name: "Asian")
    city = City.create(name: "New York")
    user = User.create(email: Faker::Internet.email, password: "password@123", password_confirmation: "password@123")
    lead_stream = LeadStream.create(user_id: user.id, category_id: category.id, city_id: city.id)
    report = Report.create(total_tweets_for_day: 3, date_collected: 1.day.ago, city_id: city.id, category_id: category.id)

    results = ReportData.last_7_days_reports_for_user(user.id)

    expect(results[0]).to eq 3

  end

end