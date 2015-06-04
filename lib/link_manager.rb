require 'url_extractor'
require 'link_shortener'

# Todo: Store the shortened url some where along with the id for the tweet reply and the actual url 

class LinkManager
  attr_accessor :text_with_links, :link_shortener

  def initialize(text_with_links)
    @text_with_links = text_with_links
    @link_shortener = LinkShortener.new
  end

  def shorten_all_urls
    shortened_urls = generate_shortened_urls(extract_urls)
    replace_all_links(shortened_urls)
    return {text_with_shortened_links: text_with_links, url_details: shortened_urls}
  end

  private
  def generate_shortened_urls(urls)
    link_shortener.shorten_links(urls)
  end

  def replace_urls(urls)
    urls.each do |url|
      shortened_url = shorten_url(url)
      replace_with_shortened_url(shortened_url[:shortened_url], url)
    end
  end

  def replace_all_links(shortened_urls)
    shortened_urls.each do |url_container|
      replace_with_shortened_url(url_container[:shortened_url], url_container[:original_url])
    end
  end

  def replace_with_shortened_url(new_url,url_to_replace)
    text_with_links.sub! url_to_replace, new_url
  end

  def extract_urls
    UrlExtractor.new(text_with_links).get_urls
  end

end