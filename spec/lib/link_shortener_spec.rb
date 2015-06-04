require 'link_shortener'

describe LinkShortener do

  it "should return a link to a shortened urbanzeak url" do
    expect(LinkShortener.new.shorten("http://google.com")[:shortened_url]).to include "http://urbanzeak.com/"
    expect(LinkShortener.new.shorten("http://google.com/test/fdhgfd/jhdsdfs")[:shortened_url]).to include "http://urbanzeak.com/"
  end

  it "should shorten all the given urls" do
    link_shortener = LinkShortener.new
    urls = ["http://google.com", "http://yahoo.com"]
    shortened_urls = link_shortener.shorten_links(urls)
    expect(shortened_urls.first[:shortened_url]).to include "http://urbanzeak.com/"
    expect(shortened_urls.first[:original_url]).to include "http://google.com"
  end

end
