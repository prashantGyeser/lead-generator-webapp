class SendMessageToQueue
  def self.get_and_convert_categories_to_string(user_id)
    user_categories = UserCategory.where(user_id: user_id)
    user_categories_array = []
    user_categories.each do |user_category|
      category = Category.find(user_category)
      user_categories_array << category
    end

    category_array = user_categories_array.map { |x| x[:name] }
    return category_array.join(',')

  end

  def self.get_and_convert_cities_to_string(user_id)
    user_cities = UserCity.where(user_id: user_id)
    user_cities_array = []
    user_cities.each do |user_city|
      city = City.find(user_city.city_id)
      user_cities_array << city
    end

    city_array = user_cities_array.map { |x| x[:name] }
    return city_array.join(',')

  end

  def self.generate_message(user_id, categories_for_user,cities_for_user_string)
    user = User.find(user_id)
    token = Token.where(user_id: user_id).first
    categories = get_and_convert_categories_to_string(user_id)
    cities = get_and_convert_cities_to_string(user_id)

    return user.email.to_s + ',' +  token.oauth_token + ',' + token.oauth_secret + ','  + categories + ',' + cities

  end

  def self.push_message_to_queue(user_id)
    # Create an IronMQ::Client object
    @ironmq = IronMQ::Client.new()

    # Get a queue (if it doesn't exist, it will be created when you first post a message)
    @queue = @ironmq.queue("new_user_queue")

    categories = get_and_convert_categories_to_string(user_id)
    cities = get_and_convert_cities_to_string(user_id)


    #message_to_post = generate_message(user_id, categories, cities)

    user = User.find(user_id)
    token = Token.where(user_id: user_id).first
    # Post a message
    response = @queue.post("#{user.id},#{token.oauth_token},#{token.oauth_secret}")

    return response.msg


    # Get a message
    #msg = @queue.get()
    #return msg

    # Delete a message (you must delete a message when you're done with it or it will go back on the queue after a timeout)
    #msg.delete # or @queue.delete(msg.id)
  end


end