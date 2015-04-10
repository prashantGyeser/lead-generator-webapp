require 'gender_detection'


# All the functions here will only work based on if a beta feature is enabled for a user.
class BetaFeatureHelper

  def set_gender_for_leads

    gender_detection = GenderDetection.new

    puts "It is in the gender generator"

    Lead.where.not(poster_name: nil).where(gender: nil).find_each do |lead|
      puts "Lead being run: #{lead.id}"
      if !lead.poster_name.nil?
        lead.gender = gender_detection.gender(lead.poster_name)
        puts lead.gender
      else
        lead.gender= 'indeterminate'
      end

      lead.save

    end
  end


end