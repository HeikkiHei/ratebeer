class User < ApplicationRecord
  include AverageRating

  has_secure_password

  has_many :ratings
  has_many :beers, through: :ratings
  has_many :memberships
  has_many :beer_clubs, through: :memberships

  validates :username, presence: true, uniqueness: true, length: 3..30
  validates :password, presence: true, length: { minimum: 4 }, confirmation: true, format: { with: /[A-Z]/, message: "Must contain capital letter (A-Z)" }
end
