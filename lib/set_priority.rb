class SetPriority

  def all_leads
    Lead.find_each do |lead|
      if lead.priority.blank?
        if SetPriority.contains_keyword?(lead.tweet)
          lead.priority = "high"
        else
          lead.priority = "low"
        end
        lead.save
      end
    end
  end


  def self.contains_keyword?(tweet_text)
    keywords = ['need','hungry','craving','crave']

    keywords.each do |word|
      if tweet_text.downcase.match(/\b#{Regexp.escape(word.downcase)}\b/)
        return true
      end
    end

    return false

  end

end