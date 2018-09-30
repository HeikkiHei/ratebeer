require 'rails_helper'

include Helpers

describe "Beer" do
  let!(:brewery) { FactoryBot.create :brewery, name:"Koff" }
  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "can be created with correct name" do
    visit new_beer_path
    fill_in('beer_name', with: 'Beer Beer')
    select('Lager', from: 'beer_style')
    select('Koff', from: 'beer_brewery_id')

    expect{
      click_button('Create Beer')
    }.to change{Beer.count}.by(1)
  end

  it "cannot be created without a name" do
    visit new_beer_path
    fill_in('beer_name', with: '')
    select('Lager', from: 'beer_style')
    select('Koff', from: 'beer_brewery_id')

    expect{
      click_button('Create Beer')
    }.to change{Beer.count}.by(0)
    expect(page).to have_content "Name can't be blank"
  end

end