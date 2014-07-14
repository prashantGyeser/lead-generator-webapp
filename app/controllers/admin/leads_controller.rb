require 'csv'
class Admin::LeadsController < Admin::ApplicationController
  def add
    # retrieve the access key and secret key
    access_key_id = 'AKIAJWXA3PNIVSK2E3MQ'
    secret_access_key = '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'

    # create an instance of the s3 client
    s3 = AWS::S3.new(access_key_id: access_key_id, secret_access_key: secret_access_key)

    # get the bucket
    bucket = s3.buckets['uz_leads_list_staging']

    # Remove margin-left in responsive.css for page content

    # retrieve the objects
    bucket.objects.each do |object|
      logger.debug object.key
      #logger.debug object.read
      csv_file = object.read
      csv_text = CSV.parse(csv_file)
      csv_text.each do |row|
        tweet_text = row[0]
        screen_name = row[1]
        location = row[2]
        profile_url = "https://twitter.com/" + screen_name
        date_last_shown = Time.now - 3.month
        Lead.create(:tweet => tweet_text, :screen_name => screen_name, :location => location, :profile_url => profile_url, :date_last_shown => date_last_shown)
      end
      object.delete
    end

  end
end
