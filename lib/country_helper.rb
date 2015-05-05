require 'string_helper'

class CountryHelper


  def detect_country(profile_location)
    Country.find_each do |country|
      country.locations.find_each do |location|
        if StringHelper.contains_string?(profile_location, location.name)
          return {country_id: country.id}
        end
      end
    end
    return {country_id: nil}
  end

end