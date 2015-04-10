class GenderDetection

  def has_whitespace?(name)
    # if there is a whitespace in the string the value will be greater than 0, marking the position of the space
    # else if there is no space this will return nil
    !name.index(/\s/).nil?
  end

  def first_name(full_name)
    full_name.split(" ")[0]
  end

  def gender(first_name)
    gender_detector = GenderDetector.new(:case_sensitive => false)
    gender_detector.get_gender(first_name)
  end

end