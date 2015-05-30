require 'rails_helper'

RSpec.describe "links/index", :type => :view do
  before(:each) do
    assign(:links, [
      Link.create!(
        :in_url => "In Url",
        :out_url => "MyText",
        :http_status => 1
      ),
      Link.create!(
        :in_url => "In Url",
        :out_url => "MyText",
        :http_status => 1
      )
    ])
  end

  it "renders a list of links" do
    render
    assert_select "tr>td", :text => "In Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
