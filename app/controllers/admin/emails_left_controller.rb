class Admin::EmailsLeftController < Admin::ApplicationController
  def index
    @emails_left = EmailLeft.all
  end

  def create_lead_stream


    keywords = params["keywords"]

    keywords.each do |keyword|
      
    end

    respond_to do |format|
      if lead_stream.save
        format.json { render :json => lead_stream, status: :created }
      else
        format.json { render :json => lead_stream.errors, status: :created }
      end
    end


  end




end
