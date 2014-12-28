namespace :notifications do
  desc "Sends an email for the new leads in a day"
  task new_leads: :environment do

    User.find_each do |user|
      lead_streams = LeadStream.where(user_id: user.id)

      lead_streams.each do |lead_stream|
        keywords = Keyword.where(lead_stream_id: lead_stream.id)
        keyword_ids = []
        keywords.each do |keyword|
          keyword_ids << keyword.id
        end

        leads = Lead.where(keyword_id: keyword_ids).where("created_at >= ?", Time.zone.now.beginning_of_day)

        if leads.count > 0
          LeadMailer.new_leads_email(leads, user).deliver
        else
          puts "No email to send for #{user.email}"
        end

      end

    end

    #LeadMailer.new_leads_email(leads, user).deliver
  end
end