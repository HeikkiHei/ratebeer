# frozen_string_literal: true

json.extract! beer, :id, :name, :style, :brewery_id, :created_at, :updated_at
json.url beer_url(beer, format: :json)
