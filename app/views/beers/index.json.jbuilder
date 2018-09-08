# frozen_string_literal: true

json.array! @beers, partial: 'beers/beer', as: :beer
