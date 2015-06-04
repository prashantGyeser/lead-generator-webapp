class LinkShortener
  attr_reader :base_url

  def initialize(base_url="http://urbanzeak.com/")
    @base_url = base_url
  end

  def shorten(link)
    random_string = generate_random_string
    shortened_url = base_url + random_string
    {shortened_url: shortened_url, random_string_identifier: random_string, original_url: link}
  end

  def shorten_links(links)
    shortened_array = []

    links.each do |link|
      shortened_array << shorten(link)
    end

    return shortened_array
  end

  private
  # generate a random string
  def generate_random_string(size = 6)
    # not doing uppercase as url is case insensitive
    charset = ('a'..'z').to_a + (0..9).to_a
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end

end