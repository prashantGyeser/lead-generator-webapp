# == Schema Information
#
# Table name: follows
#
#  id                  :integer          not null, primary key
#  twitter_screen_name :string(255)
#  user_id             :integer
#  created_at          :datetime
#  updated_at          :datetime
#

require 'rails_helper'

RSpec.describe Follow, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
