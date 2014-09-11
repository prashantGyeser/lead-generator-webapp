class SetupStatus

  def self.setup_complete?(user_id)
    lead_streams = LeadStream.where(user_id: user_id).count
    user = User.find(user_id)
    puts "The stat is: #{user.setup_complete == true}"
    puts "The stat is: #{lead_streams > 0}"
    if ((user.setup_complete == true) && (lead_streams > 0))
      return true
    else
      return false
    end


  end

  def self.number_of_steps_completed(user_id)

    user_cities = UserCity.where(user_id: user_id)
    user_categories = UserCategory.where(user_id: user_id)
    tokens = Token.where(user_id: user_id)

    steps_completed = 0

    if user_cities.count > 0
      steps_completed = steps_completed + 1
    end

    if user_categories.count > 0
      steps_completed = steps_completed + 1
    end

    if tokens.count > 0
      steps_completed = steps_completed + 1
    end

    return steps_completed

  end

  def self.number_of_streams(user_id)
    LeadStream.where(user_id: user_id).count
  end


end