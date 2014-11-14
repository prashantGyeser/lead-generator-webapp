require 'setup_status'
require 'report_data'

class Dashboard::ReportsController < Dashboard::ApplicationController
  def index

    if current_user.setup_complete != true
      redirect_to dashboard_initial_setups_index_path
    else

      #reports = ReportData.last_7_days_reports_for_user(current_user.id)
      #leads = ReportData.lead_count_for_last_7_days(current_user.id)
      #@leads_today = ReportData.total_leads_for_user_today(current_user.id)
      @leads_today = ReportData.total_leads_for_user_today(current_user.id)
      @total_leads_for_user = ReportData.total_leads_for_user(current_user.id)
      @total_replies_user_sent = ReportData.total_tweet_replies_user_sent(current_user.id)
      @total_replies_user_sent_today = ReportData.total_replies_for_user_today(current_user.id)
      @reach_today = ReportData.reach_today(current_user.id)
      @total_reach = ReportData.total_reach(current_user.id)

      total_tweets = []
      total_leads = []

      <<-DOC
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
      DOC

    end
  end
end
