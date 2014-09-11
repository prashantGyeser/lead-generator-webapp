require 'httparty'
require 'parse_and_store_reports'

class ImportReports

  def self.import_from_processor

    responce =
        HTTParty.get(ENV['PROCESSOR_SERVER_URL'] + '/api/v1/reports/all')

    responce.each do |report|
      ParseAndStoreReports.save_report(report)
    end
    return true
  end


end