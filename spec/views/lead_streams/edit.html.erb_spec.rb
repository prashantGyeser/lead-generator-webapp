require 'rails_helper'

RSpec.describe "lead_streams/edit", :type => :view do
  before(:each) do
    @lead_stream = assign(:lead_stream, LeadStream.create!(
      :user_id => 1,
      :category_id => 1,
      :city_id => 1
    ))
  end

  it "renders the edit lead_stream form" do
    render

    assert_select "form[action=?][method=?]", lead_stream_path(@lead_stream), "post" do

      assert_select "input#lead_stream_user_id[name=?]", "lead_stream[user_id]"

      assert_select "input#lead_stream_category_id[name=?]", "lead_stream[category_id]"

      assert_select "input#lead_stream_city_id[name=?]", "lead_stream[city_id]"
    end
  end
end
