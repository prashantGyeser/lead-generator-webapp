# == Schema Information
#
# Table name: user_categories
#
#  id          :integer          not null, primary key
#  category_id :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe UserCategory, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
