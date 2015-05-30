require 'rails_helper'

RSpec.describe "links/new", :type => :view do
  before(:each) do
    assign(:link, Link.new(
      :in_url => "MyString",
      :out_url => "MyText",
      :http_status => 1
    ))
  end

  it "renders new link form" do
    render

    assert_select "form[action=?][method=?]", links_path, "post" do

      assert_select "input#link_in_url[name=?]", "link[in_url]"

      assert_select "textarea#link_out_url[name=?]", "link[out_url]"

      assert_select "input#link_http_status[name=?]", "link[http_status]"
    end
  end
end
