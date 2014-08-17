require 'httparty'
require 'parse_and_store_leads'

class ImportLeads

  def self.import_from_processor

    responce =
      HTTParty.get(ENV['PROCESSOR_SERVER_URL'] + '/api/v1/leads/index')

    responce.each do |lead|
      ParseAndStoreLeads.save_lead(lead)
    end

  end


end