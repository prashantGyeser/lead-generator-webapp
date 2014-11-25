# == Schema Information
#
# Table name: keywords
#
#  id             :integer          not null, primary key
#  term           :string(255)
#  lead_stream_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Keyword < ActiveRecord::Base
end
