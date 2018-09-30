class User < ApplicationRecord
  include AverageRating

  has_secure_password

  has_many :ratings
  has_many :beers, through: :ratings
  has_many :memberships, dependent: :destroy
  has_many :beer_clubs, through: :memberships

  validates :username, presence: true, uniqueness: true, length: 3..30
  validates :password, presence: true, length: { minimum: 4 }, confirmation: true, format: { with: /[A-Z]/, message: "Must contain capital letter (A-Z)" }

  def favorite_beer
    return nil if ratings.empty?
    ratings.order(score: :desc).limit(1).first.beer
  end

  def favorite_style
    return nil if ratings.empty?
    ratings.order(score: :desc).limit(1).first.beer.style
  end

  def favorite_brewery
    return nil if ratings.empty?
    ratings.order(score: :desc).limit(1).first.beer.brewery.name
  end
end
