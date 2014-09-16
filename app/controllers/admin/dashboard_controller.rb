class Admin::DashboardController < Admin::ApplicationController
  def index
    @available_leads = Lead.where('date_last_shown < ?', (Time.now - 1.month)).count
    @total_users_today = User.where(created_at: Date.today).count
    @total_users = User.all.count
  end
end
