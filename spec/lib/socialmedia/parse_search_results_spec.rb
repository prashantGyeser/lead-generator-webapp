require 'socialmedia/parse_search_results'
require 'rails_helper'

RSpec.describe ParseSearchResults do

  before(:each) do
    @country = Country.create(name: 'United States')
    Location.create(country_id: @country.id, name: "USA")

    @tweet_location_empty = Twitter::Tweet.new({:metadata=>{:iso_language_code=>"en", :result_type=>"recent"}, :created_at=>"Tue May 05 14:44:56 +0000 2015", :id=>595600068524269568, :id_str=>"595600068524269568", :text=>"RT ecigitesztek: Good on Johnny Depp for joining the Vaping Revolution!\n\n ... https://t.co/GNKpoXH62V … #vape #ecig", :source=>"<a href=\"http://ifttt.com\" rel=\"nofollow\">IFTTT</a>", :truncated=>false, :in_reply_to_status_id=>nil, :in_reply_to_status_id_str=>nil, :in_reply_to_user_id=>nil, :in_reply_to_user_id_str=>nil, :in_reply_to_screen_name=>nil, :user=>{:id=>2908532184, :id_str=>"2908532184", :name=>"Vape Merch", :screen_name=>"vapemerch", :location=>"", :description=>"The Worlds Best #Vape Store:", :url=>"http://t.co/eCQZMZsx9z", :entities=>{:url=>{:urls=>[{:url=>"http://t.co/eCQZMZsx9z", :expanded_url=>"http://www.VaporFi.com?A=8510", :display_url=>"VaporFi.com/?A=8510", :indices=>[0, 22]}]}, :description=>{:urls=>[]}}, :protected=>false, :followers_count=>4079, :friends_count=>36, :listed_count=>79, :created_at=>"Mon Nov 24 00:57:22 +0000 2014", :favourites_count=>10, :utc_offset=>nil, :time_zone=>nil, :geo_enabled=>false, :verified=>false, :statuses_count=>45877, :lang=>"en", :contributors_enabled=>false, :is_translator=>false, :is_translation_enabled=>false, :profile_background_color=>"C0DEED", :profile_background_image_url=>"http://abs.twimg.com/images/themes/theme1/bg.png", :profile_background_image_url_https=>"https://abs.twimg.com/images/themes/theme1/bg.png", :profile_background_tile=>false, :profile_image_url=>"http://pbs.twimg.com/profile_images/536708664380239872/TN0lNF8a_normal.png", :profile_image_url_https=>"https://pbs.twimg.com/profile_images/536708664380239872/TN0lNF8a_normal.png", :profile_banner_url=>"https://pbs.twimg.com/profile_banners/2908532184/1416794622", :profile_link_color=>"0084B4", :profile_sidebar_border_color=>"C0DEED", :profile_sidebar_fill_color=>"DDEEF6", :profile_text_color=>"333333", :profile_use_background_image=>true, :default_profile=>true, :default_profile_image=>false, :following=>false, :follow_request_sent=>false, :notifications=>false}, :geo=>nil, :coordinates=>nil, :place=>nil, :contributors=>nil, :retweet_count=>0, :favorite_count=>0, :entities=>{:hashtags=>[{:text=>"vape", :indices=>[104, 109]}, {:text=>"ecig", :indices=>[110, 115]}], :symbols=>[], :user_mentions=>[], :urls=>[{:url=>"https://t.co/GNKpoXH62V", :expanded_url=>"https://twitter.com/eCigZoneManc/status/595589962357207040", :display_url=>"twitter.com/eCigZoneManc/s…", :indices=>[78, 101]}]}, :favorited=>false, :retweeted=>false, :possibly_sensitive=>false, :lang=>"en"})

  end

  it "should return country if there is a valid country match" do

    lead_stream = LeadStream.create(search_type: 'country', country_id: @country.id)
    keyword = Keyword.create(lead_stream_id: lead_stream.id)

    parse_search_results = ParseSearchResults.new
    result = parse_search_results.save_tweet("Philly, USA", keyword.id)

    expect(result).to eq @country.id

  end

  it "should return false if the location is nil" do

    lead_stream = LeadStream.create(search_type: 'country', country_id: @country.id)
    keyword = Keyword.create(lead_stream_id: lead_stream.id)

    parse_search_results = ParseSearchResults.new
    result = parse_search_results.save_tweet(nil, keyword.id)

    expect(result).to eq false

  end

  it "should return false if the location is empty" do

    lead_stream = LeadStream.create(search_type: 'country', country_id: @country.id)
    keyword = Keyword.create(lead_stream_id: lead_stream.id)

    parse_search_results = ParseSearchResults.new
    result = parse_search_results.save_tweet('', keyword.id)

    expect(result).to eq false

  end


  it "should return false if the location does not match the country in the lead stream" do

    lead_stream = LeadStream.create(search_type: 'country', country_id: @country.id)
    keyword = Keyword.create(lead_stream_id: lead_stream.id)

    parse_search_results = ParseSearchResults.new
    result = parse_search_results.save_tweet('Toronto, Ontario', keyword.id)

    expect(result).to eq false

  end


  it "should not store a tweet if the location is empty" do
    lead_stream = LeadStream.create(search_type: 'country', country_id: @country.id)
    keyword = Keyword.create(lead_stream_id: lead_stream.id)

    parse_search_results = ParseSearchResults.new
    result = parse_search_results.single_tweet(@tweet_location_empty, keyword.id, 'country')

    expect(UnprocessedTweet.last).to eq nil
  end


end

