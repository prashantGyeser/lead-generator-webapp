class Dashboard::KeywordController < Dashboard::ApplicationController
  def index
    lead_stream = LeadStream.find_by_user_id(current_user.id)
    @keywords = Keyword.where(lead_stream_id: lead_stream.id).where(admin_created: nil).where(archived: nil)

    @not_working_keywords = []
    @keywords.each do |keyword|
      if keyword.not_working == true && !(keyword.archived == true)
        @not_working_keywords << keyword
      end

    end

  end

  def remove
    keyword = Keyword.find(params[:keyword_id])
    keyword.archived = true

    respond_to do |format|
      if keyword.save
        format.json { render :json => keyword, status: :created }
      else
        format.json { render :json => keyword.errors, status: 500 }
      end
    end

  end

  def add

    lead_stream = LeadStream.find_by_user_id(current_user.id);
    keyword = Keyword.new(term: params[:term], lead_stream_id: lead_stream.id)

    respond_to do |format|
      if keyword.save
        format.json { render :json => keyword, status: :created }
      else
        format.json { render :json => keyword.errors, status: 500 }
      end
    end

  end

end
