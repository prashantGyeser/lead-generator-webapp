require 'rails_helper'

RSpec.describe "lead_streams/show", :type => :view do
  before(:each) do
    @lead_stream = assign(:lead_stream, LeadStream.create!(
      :user_id => 1,
      :category_id => 2,
      :city_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
