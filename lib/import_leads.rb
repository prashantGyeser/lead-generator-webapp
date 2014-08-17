require 'httparty'

class ImportLeads

  def self.import_from_processor

    responce =
      HTTParty.get(ENV['PROCESSOR_SERVER_URL'] + '/api/v1/leads/index')

    return responce

  end

end