cities_array = %(
Nashville
San Diego
Philadelphia
Chicago
Washington DC
Dallas
Atlanta
Los Angeles
Salt Lake City
Denver
Seattle
Boston
Austin
New York
San Jose
San Francisco
Houston
Phoenix
San Antonio
Jacksonville
Indianapolis
Columbus
Charlotte
Detroit
Miami
Memphis
Oakland
Las Vegas
Fort Worth
Baltimore
Reno
Redwood City
Sparks
Truckee
Toronto
London
).split(/\n/).reject(&:empty?)

cities_array = ["Nashville", "San Diego", "Philadelphia", "Chicago", "Washington DC", "Dallas", "Atlanta", "Los Angeles", "Salt Lake City", "Denver", "Seattle", "Boston", "Austin", "New York", "San Jose", "San Francisco", "Houston", "Phoenix", "San Antonio", "Jacksonville", "Indianapolis", "Columbus", "Charlotte", "Detroit", "Miami", "Memphis", "Oakland", "Las Vegas", "Fort Worth", "Baltimore", "Reno", "Redwood City", "Sparks", "Truckee", "Toronto", "London"]

cities_array.each do |city|
  cities_exist = City.where(name: city).count
  if cities_exist > 0
  else
    City.create(name: city)
  end
end