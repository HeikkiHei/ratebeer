# frozen_string_literal: true

require 'test_helper'

class BreweriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @brewery = breweries(:one)
  end
end
