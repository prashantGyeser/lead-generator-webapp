# == Schema Information
#
# Table name: site_emails
#
#  id                :integer          not null, primary key
#  email             :string(255)
#  notification_sent :boolean          default(FALSE)
#  created_at        :datetime
#  updated_at        :datetime
#

require 'rails_helper'

RSpec.describe SiteEmail, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
