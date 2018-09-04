require "application_system_test_case"

class BreweriesTest < ApplicationSystemTestCase
  setup do
    @brewery = breweries(:one)
  end

  test "visiting the index" do
    visit breweries_url
    assert_selector "h1", text: "Breweries"
  end

  test "creating a Brewery" do
    visit breweries_url
    click_on "New Brewery"

    fill_in "Name", with: @brewery.name
    fill_in "Year", with: @brewery.year
    click_on "Create Brewery"

    assert_text "Brewery was successfully created"
    click_on "Back"
  end

  test "updating a Brewery" do
    visit breweries_url
    click_on "Edit", match: :first

    fill_in "Name", with: @brewery.name
    fill_in "Year", with: @brewery.year
    click_on "Update Brewery"

    assert_text "Brewery was successfully updated"
    click_on "Back"
  end

  test "destroying a Brewery" do
    visit breweries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Brewery was successfully destroyed"
  end
end
