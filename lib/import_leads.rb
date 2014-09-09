require 'httparty'
require 'parse_and_store_leads'

class ImportLeads

  def self.import_from_processor

    puts "The server being connected to id: #{ENV['PROCESSOR_SERVER_URL']}"

    responce =
      HTTParty.get(ENV['PROCESSOR_SERVER_URL'] + '/api/v1/leads/index')

    puts "The responce is: #{responce.inspect}"

    responce.each do |lead|
      ParseAndStoreLeads.save_lead(lead)
    end

  end


end