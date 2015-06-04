class StoreShortenedLinks
  attr_reader :links, :tweet_reply_id

  def initialize(links, tweet_reply_id)
    @links = links
    @tweet_reply_id = tweet_reply_id
  end

  def store_links
    links.each do |link|
      store_link(link)
    end
  end

  private
  def store_link(link)
    Link.create(in_url: link[:original_url], out_url: link[:shortened_url], tweet_reply_id: tweet_reply_id)
  end

end