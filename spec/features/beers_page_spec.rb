require 'rails_helper'

include Helpers

describe "Beer page" do
  let!(:brewery) { FactoryBot.create :brewery, name:"Koff" }
  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
    visit beers_path
  end

  it "can navigate to New Beer" do
    click_link "New Beer"
    expect(page).to have_content "New Beer"
    expect(page).to have_content "Name"
    expect(page).to have_content "Style"
  end

  it "can create new beer with correct name" do
    click_link "New Beer"
    fill_in('beer_name', with: 'Beer Beer')
    select('Lager', from: 'beer_style')
    select('Koff', from: 'beer_brewery_id')

    expect{
      click_button('Create Beer')
    }.to change{Beer.count}.by(1)
  end

  it "cannot create new beer without a name" do
    click_link "New Beer"
    fill_in('beer_name', with: '')
    select('Lager', from: 'beer_style')
    select('Koff', from: 'beer_brewery_id')

    expect{
      click_button('Create Beer')
    }.to change{Beer.count}.by(0)
    expect(page).to have_content "Name can't be blank"
  end

end