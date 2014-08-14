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
end