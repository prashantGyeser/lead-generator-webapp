class StringHelper

  def self.split_into_word_array(string_to_split)
    string_to_split.split(/\W+/)
  end

  def self.elements_exist_in_second_array?(array_1, array_2)
    if (array_1 - array_2).count >= array_1.count
      return false
    end
    return true
  end

  def self.contains_string?(string_1, string_2)
    string_1.include?(string_2)
  end

end