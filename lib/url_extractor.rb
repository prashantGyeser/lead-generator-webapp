class UrlExtractor
  attr_reader :text_with_url

  def initialize(text_to_extract)
    @text_with_url = text_to_extract
  end

  def get_urls
    extract_urls(text_with_url)
  end

  private
  def extract_urls(string_to_extract_from)
    string_to_extract_from.scan(/\S+[.]\S+/xms)
  end

end