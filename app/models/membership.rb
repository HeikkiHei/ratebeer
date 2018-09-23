class Membership < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :beer_club
end
