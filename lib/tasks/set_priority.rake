require 'set_priority'

namespace :set_priority do
  desc "Set priority based on the words present"
  task all_leads: :environment do
    set_priority = SetPriority.new
    set_priority.all_leads
  end
end