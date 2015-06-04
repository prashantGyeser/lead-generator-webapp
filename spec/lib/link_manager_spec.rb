require 'link_manager'

describe LinkManager do

  it "should shorten all the urls in a given text" do
    text_with_links = 'Some text with a link in it like http://google.com and another link like http://yahoo.com'
    shortened_container = LinkManager.new(text_with_links).shorten_all_urls

    expect(shortened_container[:text_with_shortened_links]).to include "http://urbanzeak.com"
    expect(shortened_container[:url_details].count).to eq 2
  end


end