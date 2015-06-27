require 'content_discovery/keyword_extractor'
require 'rails_helper'

describe KeywordExtractor do
  before(:each) do
    @sample_content = "I recently discovered a really handy gem called Highscore which makes it extremely simple to find and rank keywords in a string or body of text. The gem creator Dominik Liebler has been very receptive to suggestions and enhancements and I find myself using it quite a bit. My favorite use case is adding tags to blog posts– just pass the blog body to the gem and it’ll spit out the most relevant keywords from the content. I added support for custom regular expressions (accepted and merged into the latest version) so you can hone in on any type of keyword you want."
  end

  it "should return a setup of keywords given a valid text" do
    keywords = KeywordExtractor.new.get_keywords(@sample_content)
    expect(keywords.first.text).to eq 'find'
  end

  it "should do something" do
    text = "How I did on Twitter this week: 1 Mentions, 333 Mention Reach. How'd your week go? via http://sumall.com/myweek
Do you know who are awesome? My 4 new followers in the last week! Growing with http://www.crowdfireapp.com/?r=tw
Growing and engaging with the right tweeps - gained 10 new followers in the past week, courtesy http://www.crowdfireapp.com/?r=tw
8 new followers in the last week and it is more than just stats, I use it for growing my account! Try it http://www.crowdfireapp.com/?r=tw
Plan to beautify Alappuzha beaches: The District Tourism Promotion Council (DTPC) has decided to undertake the… http://bit.ly/1JE4Vy3
Gobble Says It Has Delivered 230K Easy-To-Cook Meals Since Launching Last Year #techcrunch #startups http://techcrunch.com/2015/05/21/gobble-growth/ …
New obsession: lobster guacamole. Sriracha on the side. #sriracha #sriracha2go @LaCerveceriaNYC
10 Hacks to Help Your Website Generate More Leads, Sales and Revenue #ecommerce #conversion #growth #digital 245454 http://klou.tt/1hhc1vekbjhdo
4 Essential Steps to Managing Growth #startups #growth #digital http://klou.tt/1wbkg7xtvcqf6
How to Market to the iGeneration http://klou.tt/15bzlpshqxr5n  #marketing #startups #growth #digital
The #PVaperEazy is a revolutionary #ecigarette, which changed the face of vaping overnight. "

    keywords = KeywordExtractor.new.get_keywords(text)
    #expect(keywords).to eq 'find'
  end

end
