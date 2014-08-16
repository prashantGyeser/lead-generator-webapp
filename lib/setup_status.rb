class SetupStatus

  def self.setup_complete?(user_id)
    user_cities = UserCity.where(user_id: user_id)
    user_categories = UserCategory.where(user_id: user_id)
    tokens = Token.where(user_id: user_id)

    if ((user_cities.count > 0) && (user_categories.count > 0) && (tokens.count > 0))
      return true
    end

    return false

  end

end