require 'parse_and_store_leads'

class Api::V1::LeadsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :batch_create

  def batch_create

    puts "Okay it is getting here"

    leads = params["_json"]

    puts "The leads count is: #{leads.count}"

    leads.each do |lead|
      ParseAndStoreLeads.save_lead(lead)
    end

    respond_to do |format|
      format.json { render json: {message: 'Completed storing'}, status: :ok }
    end

  end
end
