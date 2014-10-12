require 'parse_and_store_leads'

class Api::V1::LeadsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def batch_create

    puts "Okay it is getting here"
    puts "The params are: #{params.inspect}"

    leads = params["_json"]

    leads.each do |lead|
      ParseAndStoreLeads.save_lead(lead)
    end

    render json: {message: 'Completed storing'}, status: :ok

  end
end
