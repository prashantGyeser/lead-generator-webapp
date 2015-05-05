namespace :setup do
  desc "Setup a list of all the countries in the world"
  task countries: :environment do

    countries = ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"]

    countries.each do |country|
      Country.create(name: country)
    end

  end



  desc "Setup the country subdivisions"
  task country_subdivisions: :environment do

    CountrySubdivision.create(radius: 1005, latitude: 39.90973, longitude:-114.87304, country_id: Country.find_by_name("United States").id )
    CountrySubdivision.create(radius: 1204, latitude: 38.41055, longitude:-97.03125, country_id: Country.find_by_name("United States").id )
    CountrySubdivision.create(radius: 1198, latitude: 33.6512, longitude: -72.99316, country_id: Country.find_by_name("United States").id )

    CountrySubdivision.create(radius: 650, latitude: 55.378051, longitude:-3.435973, country_id: Country.find_by_name("United Kingdom").id )

    CountrySubdivision.create(radius: 1680, latitude: 61.90544, longitude:-132.53817, country_id: Country.find_by_name("Canada").id )
    CountrySubdivision.create(radius: 1390, latitude: 57.85363, longitude:-77.51864, country_id: Country.find_by_name("Canada").id )

    CountrySubdivision.create(radius: 2277, latitude: -29.48732, longitude:133.07201, country_id: Country.find_by_name("Australia").id )

    CountrySubdivision.create(radius: 1170, latitude: 19.85143, longitude: 79.05077, country_id: Country.find_by_name("India").id )

    CountrySubdivision.create(radius: 1000, latitude: -40.900557, longitude: 174.885971, country_id: Country.find_by_name("New Zealand").id )

  end

  desc 'Setup US locations'
  task us_locations: :environment do
    csv = CSV.read('us_locations.csv')
    location_array = csv.flatten

    puts 'Storing locations against the US...'
    country = Country.find_by_name('United States')

    location_array.each do |location|
      location_saved = Location.create(name: location, country_id: country.id)
      if location_saved.id.nil?
        puts "Failed to save #{location} with errors #{location_saved.errors.messages.inspect}"
      end
    end

    puts "Total locations: #{Location.count}"



  end

end