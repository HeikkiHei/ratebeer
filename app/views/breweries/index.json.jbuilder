# frozen_string_literal: true

json.array! @breweries, partial: 'breweries/brewery', as: :brewery
