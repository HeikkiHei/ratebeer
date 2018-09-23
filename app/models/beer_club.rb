class BeerClub < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  validates :name, :founded, :city, presence: true, allow_blank: false
end
