require "application_system_test_case"

class BeerClubsTest < ApplicationSystemTestCase
  setup do
    @beer_club = beer_clubs(:one)
  end

  test "visiting the index" do
    visit beer_clubs_url
    assert_selector "h1", text: "Beer Clubs"
  end

  test "creating a Beer club" do
    visit beer_clubs_url
    click_on "New Beer Club"

    fill_in "City", with: @beer_club.city
    fill_in "Founded", with: @beer_club.founded
    fill_in "Name", with: @beer_club.name
    click_on "Create Beer club"

    assert_text "Beer club was successfully created"
    click_on "Back"
  end

  test "updating a Beer club" do
    visit beer_clubs_url
    click_on "Edit", match: :first

    fill_in "City", with: @beer_club.city
    fill_in "Founded", with: @beer_club.founded
    fill_in "Name", with: @beer_club.name
    click_on "Update Beer club"

    assert_text "Beer club was successfully updated"
    click_on "Back"
  end

  test "destroying a Beer club" do
    visit beer_clubs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Beer club was successfully destroyed"
  end
end
