class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :beer_club

  validates :beer_club, uniqueness: {
    scope: :user,
    message: "You are already a member!"
  }
end
