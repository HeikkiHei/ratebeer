# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :beer

  def to_s
    "#{beer.name} #{score}"
  end
end
