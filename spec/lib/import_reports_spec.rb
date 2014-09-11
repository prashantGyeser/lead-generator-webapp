require 'rails_helper'
require 'import_reports'


RSpec.describe ImportReports do

  it "should get all the reports from the processor" do
    results = ImportReports.import_from_processor
    expect(results).to eq true
  end



end