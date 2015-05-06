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


  def location_in_country?(profile_location, country_id)
    country = Country.find(country_id)

    country.locations.find_each do |location|
      if StringHelper.contains_string?(profile_location, location.name)
        return true
      end
    end
    return false
  end

end