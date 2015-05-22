require 'socialmedia/twitter_search'
require 'rails_helper'

RSpec.describe Search do

  it "should return all the results for a keyword geocoded search" do
    #client = Client.initialize_twitter(ENV['TWITTER_ADMIN_ACCESS_TOKEN'], ENV['TWITTER_ADMIN_TOKEN_SECRET'])

    user = User.create(email: 'prashant@urbanzeak.com', password: 'password@123', password_confirmation: 'password@123')
    token = Token.create(user_id: user.id, oauth_token: '2431831016-cQXzpH7eoR7iSBO2A3nb7OLWzNcPBGngAeIxlEz', oauth_secret: '2iIxN9FmebV6cHLNZxugz16z3m9qogJIKhc6ubkgHfWM7')
    lead_stream = LeadStream.create(user_id: user.id, search_type: "geocoded")
    keyword = Keyword.create(lead_stream_id: lead_stream.id, term: 'immigration')

    search_args = {}
    search_args[:search_type] = lead_stream[:search_type]

    puts "It is past this"

    search_args[:latitude] = 51.555050
    search_args[:longitude] = -0.173440
    search_args[:keyword] = keyword

    search_results = TwitterSearch.new(user, search_args).search

    iterator_args = {}
    iterator_args[:keyword] = keyword
    iterator_args[:search_type] = lead_stream.search_type


    TwitterResultsIterator.new(search_results,iterator_args).iterate

    expect(UnprocessedTweet.count).to eq true

  end

end