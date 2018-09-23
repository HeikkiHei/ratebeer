class User < ApplicationRecord
  include AverageRating

  has_secure_password

  has_many :ratings
  has_many :beers, through: :ratings
  has_many :memberships
  has_many :beer_clubs, through: :memberships

  validates :username, uniqueness: true, length: 3..30
  validates :password, length: { minimum: 4 }, confirmation: true, format: { with: /[A-Z|ÅÄÖ]/, message: "Must contain capital letter (A-Z)" }
end
