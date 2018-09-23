# frozen_string_literal: true

class Brewery < ApplicationRecord
  include AverageRating

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  validates :name, presence: true, allow_blank: false
  validates :year, inclusion: { in: 1040..Time.now.year }, numericality: true

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end

  def restart
    self.year = 2018
    puts "changed year to #{year}"
  end
end
