require 'import_leads'

namespace :import do
  desc "Imports all the leads from processor"
  task leads: :environment do
    import_leads = ImportLeads.new
    import_leads.import_from_processor
  end
end