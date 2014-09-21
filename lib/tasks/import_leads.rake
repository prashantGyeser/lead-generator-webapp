require 'import_leads'

namespace :import do
  desc "Imports all the leads from processor"
  task leads: :environment do
    ImportLeads.import_from_processor
  end
end