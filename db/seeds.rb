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


City.create(city_name: 'New York')
City.create(city_name: 'Chicago')
City.create(city_name: 'Los Angeles')
City.create(city_name: 'San Francisco')
