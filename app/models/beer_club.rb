class BeerClub < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user

  validates :name, :founded, :city, presence: true, allow_blank: false
end
