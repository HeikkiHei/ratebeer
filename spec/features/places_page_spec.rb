require 'rails_helper'

describe "Places" do
  it "if one is returned by the API, it is shown at the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
      [ Place.new( name:"Oljenkorsi", id: 1 ) ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
  end

  it "if multiple are returned by the API, all are shown at the page" do
    allow(BeermappingApi).to receive(:places_in).with("räkänurkka").and_return(
      [ Place.new( name:"Kantakapakka", id: 1 ),
        Place.new( name:"Kulmabaari", id: 2 ),
        Place.new( name:"Mahtijuottola", id: 3 ) ]
    )

    visit places_path
    fill_in('city', with: 'räkänurkka')
    click_button "Search"

    expect(page).to have_content "Kantakapakka"
    expect(page).to have_content "Kulmabaari"
    expect(page).to have_content "Mahtijuottola"
  end

  it "if none returned by the API, notice at the page" do
    allow(BeermappingApi).to receive(:places_in).with("tyhjälä").and_return(
      []
    )

    visit places_path
    fill_in('city', with: 'tyhjälä')
    click_button "Search"

    expect(page).to have_content "No locations in tyhjälä"
  end
end