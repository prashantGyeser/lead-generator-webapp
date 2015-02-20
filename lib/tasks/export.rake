require 'export'

namespace :export do

  desc "Export all the leads to the training data table"
  task leads_to_table: :environment do
    export = Export.new
    export.leads_to_table
  end

end