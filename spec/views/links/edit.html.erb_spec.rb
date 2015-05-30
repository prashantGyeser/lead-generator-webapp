require 'rails_helper'

RSpec.describe "links/edit", :type => :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      :in_url => "MyString",
      :out_url => "MyText",
      :http_status => 1
    ))
  end

  it "renders the edit link form" do
    render

    assert_select "form[action=?][method=?]", link_path(@link), "post" do

      assert_select "input#link_in_url[name=?]", "link[in_url]"

      assert_select "textarea#link_out_url[name=?]", "link[out_url]"

      assert_select "input#link_http_status[name=?]", "link[http_status]"
    end
  end
end
