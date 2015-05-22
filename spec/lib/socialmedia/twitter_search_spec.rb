require 'socialmedia/twitter_search'
require 'csv'
require 'rails_helper'

RSpec.describe Search do

  it "should return all the results for a keyword geocoded search" do
    #client = Client.initialize_twitter(ENV['TWITTER_ADMIN_ACCESS_TOKEN'], ENV['TWITTER_ADMIN_TOKEN_SECRET'])

    user = User.create(email: 'prashant@urbanzeak.com', password: 'password@123', password_confirmation: 'password@123')
    token = Token.create(user_id: user.id, oauth_token: '2431831016-cQXzpH7eoR7iSBO2A3nb7OLWzNcPBGngAeIxlEz', oauth_secret: '2iIxN9FmebV6cHLNZxugz16z3m9qogJIKhc6ubkgHfWM7')
    lead_stream = LeadStream.create(user_id: user.id, search_type: "geocoded")


    search_args = {}
    search_args[:search_type] = lead_stream[:search_type]


    search_args[:latitude] = 51.555050
    search_args[:longitude] = -0.173440

    keywords = ['illegal immigration', 'illegal immigrant', 'boarder controls', 'national health service', 'patient care nhs','complaints nhs','high taxes', 'unfair taxation', 'tax rise', 'high unemployment', "can find job",  "can find work", "elder care", 'neglect disabled', 'abuse disabled', 'education standards', 'schools quality', 'gun control', 'public safety', 'law enforcement', 'drunk driving', 'drug abuse', 'alcohol treatment', 'mental illness', 'sexual harrassment', 'domestic violence', 'bully children', 'social media bullying', 'teen suicide', 'pension senior citizens', 'care for aged', 'conditons senior citizens', 'high prices', 'cost of living', 'low wages']

    keywords.each do |single_keyword|
      keyword = Keyword.create(lead_stream_id: lead_stream.id, term: single_keyword)

      search_args[:keyword] = keyword

      #search_results = TwitterSearch.new(user, search_args).search

      iterator_args = {}
      iterator_args[:keyword] = keyword
      iterator_args[:search_type] = lead_stream.search_type


      #TwitterResultsIterator.new(search_results,iterator_args).iterate


    end

    # CSV.open("geocode_results/all_tweets.csv", "w") do |csv|
    #   csv << ['Username', 'Tweet']
    #   UnprocessedTweet.find_each do |unprocessed_tweet|
    #     csv << [unprocessed_tweet.poster_screen_name, unprocessed_tweet.tweet_body]
    #   end
    #
    # end





    expect(UnprocessedTweet.count).to be > 0

  end

end