# == Schema Information
#
# Table name: keywords
#
#  id                   :integer          not null, primary key
#  term                 :string(255)
#  lead_stream_id       :integer
#  created_at           :datetime
#  updated_at           :datetime
#  admin_created        :boolean
#  archived             :boolean          default(FALSE)
#  last_searched        :datetime
#  last_result_count    :integer
#  last_duplicate_count :integer
#  not_working          :boolean
#  last_run             :datetime
#

require 'rails_helper'

RSpec.describe Keyword, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
