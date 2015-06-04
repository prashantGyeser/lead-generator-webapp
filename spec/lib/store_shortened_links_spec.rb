require 'store_shortened_links'
require 'rails_helper'

describe StoreShortenedLinks do

  before(:each) do
    @links = [
        {original_url: "http://google.com", shortened_url: "http://urbanzeak.com/32432", random_string_identifier: "32432"},
        {original_url: "http://yahoo.com", shortened_url: "http://urbanzeak.com/32dsf", random_string_identifier: "32dsf"}
    ]
  end

  it "should store a list of urls" do
    StoreShortenedLinks.new(@links, 1).store_links
    expect(Link.count).to be > 0
  end

end
