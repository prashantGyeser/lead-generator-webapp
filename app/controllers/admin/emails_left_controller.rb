class Admin::EmailsLeftController < Admin::ApplicationController
  def index
    @emails_left = EmailLeft.all
  end

  def create_lead_stream
    keywords = params["keywords"]
    email_left = EmailLeft.find(params["email_left_id"])

    lead_stream = LeadStream.new(email_left_id: email_left.id, city_name: email_left.city)

    keywords.each do |term|
      lead_stream.keywords.build(term: term)
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
