require 'rails_helper'
require 'notification_helper'
require 'faker'

RSpec.describe NotificationHelper do

  it "should store a notification" do
    notification_helper = NotificationHelper.new
    expect(notification_helper.set_generic_email(1)).to be true
  end

end