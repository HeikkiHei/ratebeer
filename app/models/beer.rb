# frozen_string_literal: true

class Beer < ApplicationRecord
  include AverageRating

  belongs_to :brewery
  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user

  validates :name, :style, presence: true, allow_blank: false

  def to_s
    "#{name} #{brewery.name}"
  end
end
