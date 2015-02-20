class Export

  def leads_to_table
    Lead.where("created_at >= :date", date: "2014-12-01").each do |lead|

      keyword = Keyword.find(lead.keyword_id)
      lead_stream = LeadStream.find(keyword.lead_stream_id)
      user = User.find(lead_stream.user_id)
      sample_category = SampleCategory.find(user.sample_category_id)

      training_data_export = TrainingDataExport.new(tweet_id: lead.tweet_id, tweet_body: lead.tweet_body, type: "lead", category: sample_category.name, keyword_term: keyword.term )

      if training_data_export.save
        puts "Saved successfully"
      else
        puts "Something went wrong: #{training_data_export.inspect}"
        puts "The errors are: #{training_data_export.errors.inspect}"
      end

    end
  end

end