# == Schema Information
#
# Table name: beta_signups
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe BetaSignup, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
