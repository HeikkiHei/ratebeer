# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

b1 = Brewery.create name: 'Koff', year: 1897
b2 = Brewery.create name: 'Malmgard', year: 2001
b3 = Brewery.create name: 'Weihenstephaner', year: 1040

beer1 = b1.beers.create name: 'Iso 3', style: 'Lager'
beer2 = b1.beers.create name: 'Karhu', style: 'Lager'
beer3 = b1.beers.create name: 'Tuplahumala', style: 'Lager'
beer4 = b2.beers.create name: 'Huvila Pale Ale', style: 'Pale Ale'
beer5 = b2.beers.create name: 'X Porter', style: 'Porter'
beer6 = b3.beers.create name: 'Hefeweizen', style: 'Weizen'
b3.beers.create name: 'Helles', style: 'Lager' # No ratings, not a variable

beer1.ratings.create score: 10
beer1.ratings.create score: 25
beer1.ratings.create score: 45
beer2.ratings.create score: 100
beer3.ratings.create score: -10
beer3.ratings.create score: 10
beer4.ratings.create score: 50
beer4.ratings.create score: 20
beer5.ratings.create score: 10
beer6.ratings.create score: 20
beer6.ratings.create score: 20
beer6.ratings.create score: 20
beer6.ratings.create score: 20
