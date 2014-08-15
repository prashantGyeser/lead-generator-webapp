# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Setting up categories
bar_category = Category.create(name: "bar")
pizzeria_category = Category.create(name: "pizzeria")
cafe_category = Category.create(name: "cafe")
mexican_category = Category.create(name: "mexican")
italian_category = Category.create(name: "italian")
japanese_category = Category.create(name: "japanese")
american_category = Category.create(name: "american")
chinese_category = Category.create(name: "chinese")
asian_category = Category.create(name: "asian")
indian_category = Category.create(name: "indian")
arabic_category = Category.create(name: "arabic")
south_american_category = Category.create(name: "south_american")
barbecue_category = Category.create(name: "barbecue")


City.create(city_name: 'New York', city_code: 'NYC', latitude: 40.715000, longitude: -74.010962)
City.create(city_name: 'Chicago', city_code: 'Chicago', latitude: 41.873626, longitude: -87.620919)
City.create(city_name: 'Los Angeles', city_code: 'LA', latitude: 34.052363, longitude: -118.263417)
City.create(city_name: 'San Francisco', city_code: 'SFO', latitude: 37.774527, longitude: -122.423867)
