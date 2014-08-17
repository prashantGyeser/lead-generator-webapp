namespace :import_leads do
  desc "Imports all the leads from processor"
  task initial_import: :environment do
    ImportLeads.import_from_processor
  end
end