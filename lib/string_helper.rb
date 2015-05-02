class StringHelper

  def self.split_into_word_array(string_to_split)
    string_to_split.split(/\W+/)
  end

end