class UrlExtractor
  attr_reader :text_with_url

  def initialize(text_to_extract)
    @text_with_url = text_to_extract
  end

  def get_urls
    URI.extract(text_with_url)
  end

end