require 'rails_helper'

RSpec.describe "lead_streams/index", :type => :view do
  before(:each) do
    assign(:lead_streams, [
      LeadStream.create!(
        :user_id => 1,
        :category_id => 2,
        :city_id => 3
      ),
      LeadStream.create!(
        :user_id => 1,
        :category_id => 2,
        :city_id => 3
      )
    ])
  end

  it "renders a list of lead_streams" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
