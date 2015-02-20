class Admin::ExportController < Admin::ApplicationController
  def leads
    @leads = Lead.where.not(keyword_id: nil).where("created_at > ?", "2014-12-01" ).paginate(page: params[:page], per_page: 100)
  end
end
