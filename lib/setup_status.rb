class SetupStatus

  def self.setup_complete?(user_id)
    lead_streams = LeadStream.where(user_id: user_id).count
    tokens = Token.where(user_id: user_id).count
    if ((lead_streams > 0) && (tokens > 0))
      return true
    else
      return false
    end
  end

  def self.lead_stream_created?(user_id)
    lead_streams = LeadStream.where(user_id: user_id).count
    if lead_streams > 0
      return true
    else
      return false
    end
  end

  def self.twitter_connected?(user_id)
    tokens = Token.where(user_id: user_id).count
    if tokens > 0
      return true
    else
      return false
    end
  end



end