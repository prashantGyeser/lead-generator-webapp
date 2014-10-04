class Dashboard::TodaysLeadsController < Dashboard::ApplicationController
  def index
    @user_leads = UserLead.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
end
