require 'rails_helper'

RSpec.describe "links/show", :type => :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      :in_url => "In Url",
      :out_url => "MyText",
      :http_status => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/In Url/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end
