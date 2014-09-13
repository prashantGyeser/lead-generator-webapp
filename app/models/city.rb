# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class City < ActiveRecord::Base

  validates :name, :uniqueness => true

  def capitalized_name
    return self.name.split.map(&:capitalize).join(' ')
  end
end
