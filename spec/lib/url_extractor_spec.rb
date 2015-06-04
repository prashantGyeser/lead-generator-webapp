require 'url_extractor'

describe UrlExtractor do

  it "should return an array of urls in a given text" do
    text_with_url = "This is a test with a fully formed url http://google.com"
    expect(UrlExtractor.new(text_with_url).get_urls).to eq ["http://google.com"]
  end

  it "should return a url when it does not have a leading http" do
    text_with_url = "This is a test with a fully formed url google.com"
    expect(UrlExtractor.new(text_with_url).get_urls).to eq ["google.com"]
  end

  it "should extract multiple urls" do
    text_with_url = "This is a test with a fully formed url google.com and http://yahoo.com"
    expect(UrlExtractor.new(text_with_url).get_urls).to eq ["google.com", "http://yahoo.com"]
  end

end
