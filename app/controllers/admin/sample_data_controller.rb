class Admin::SampleDataController < Admin::ApplicationController
  def categories
    @sample_categories = SampleCategory.all
  end

  def tweets
    @category_id = params[:id]
    @sample_category = SampleCategory.find(@category_id)
    @sample_leads = SampleLead.where(sample_category_id: @category_id)
  end

  def create_category

    sample_category = SampleCategory.new
    sample_category.name = params[:name]

    respond_to do |format|
      if sample_category.save
        format.json { render :json => sample_category, status: :created }
      else
        format.json { render :json => sample_category.errors, status: 500 }
      end
    end
  end

  def create_lead

    sample_lead = SampleLead.new
    sample_lead.sample_category_id = params[:sample_category_id]
    sample_lead.screen_name = params[:screen_name]
    sample_lead.tweet = params[:tweet]

    respond_to do |format|
      if sample_lead.save
        format.json { render :json => sample_lead, status: :created }
      else
        format.json { render :json => sample_lead.errors, status: 500 }
      end
    end
  end

end
