require 'setup_status'
require 'report_data'

class Dashboard::ReportsController < Dashboard::ApplicationController
  def index

    if current_user.setup_complete != true
      redirect_to dashboard_initial_setups_index_path
    else

      reports = ReportData.last_7_days_reports_for_user(current_user.id)
      leads = ReportData.lead_count_for_last_7_days(current_user.id)

      total_tweets = []
      total_leads = []

      reports.each_with_index do |report, index|
        total_tweets << [index, report]
      end

      leads.each_with_index do |lead, index|
        total_leads << [index, lead]
      end


      @leads_count = total_leads
      @tweets_count = total_tweets
      gon.leads_count = @leads_count
      gon.tweets_count = @tweets_count


    end
  end
end
