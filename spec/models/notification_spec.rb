# == Schema Information
#
# Table name: notifications
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  created_at        :datetime
#  updated_at        :datetime
#  message           :text
#  archived          :boolean          default(FALSE)
#  notification_type :string(255)
#

require 'rails_helper'

RSpec.describe Notification, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
