require 'rails_helper'

include Helpers

describe "User" do
  before :each do
    FactoryBot.create :user
  end

  describe "who has signed up" do
    it "can signin with right credentials" do
      sign_in(username: "Pekka", password: "Foobar1")

      expect(page).to have_content 'Welcome back!'
      expect(page).to have_content 'Pekka'
    end

    it "is redirected back to signin form if wrong credentials given" do
      sign_in(username: "Pekka", password: "wrong")

      expect(current_path).to eq(signin_path)
      expect(page).to have_content 'Username and/or password mismatch'
    end
  end

  it "when signed up with good credentials, is added to the system" do
    visit signup_path
    fill_in('user_username', with: 'Brian')
    fill_in('user_password', with: 'Secret55')
    fill_in('user_password_confirmation', with: 'Secret55')

    expect{
      click_button('Create User')
    }.to change{User.count}.by(1)
  end

  describe "who is signed in" do
    let!(:user) { FactoryBot.create :user, username: "Reittaaja" }
    let!(:otherguy) { FactoryBot.create :user, username: "PahaPekka" }
    let!(:brewery) { FactoryBot.create :brewery, name:"Koff" }
    let!(:beer1) { FactoryBot.create :beer, name:"iso 3", brewery:brewery }
    let!(:beer2) { FactoryBot.create :beer, name:"Karhu", brewery:brewery }

    it "has zero ratings if has not rated" do
      sign_in(username: "Reittaaja", password: "Foobar1")
      expect(page).to have_content 'Ratings' 
      expect(page).to have_content 'User has not yet rated!' 
    end 

    it "has ratings listed on home page if has rated" do
      FactoryBot.create(:rating, score: 20, user: user, beer: beer1)
      FactoryBot.create(:rating, score: 15, user: user, beer: beer2)
      sign_in(username: "Reittaaja", password: "Foobar1")
      expect(page).to have_content 'Ratings' 
      expect(page).to have_content 'iso 3 20' 
      expect(page).to have_content 'Karhu 15' 
    end 

    it "has only own ratings listed on home page if has rated" do
      FactoryBot.create(:rating, score: 20, user: user, beer: beer1)
      FactoryBot.create(:rating, score: 15, user: user, beer: beer2)
      FactoryBot.create(:rating, score: 30, user: otherguy, beer: beer1)
      FactoryBot.create(:rating, score: 40, user: otherguy, beer: beer2)
      sign_in(username: "Reittaaja", password: "Foobar1")
      expect(page).to have_content 'Ratings' 
      expect(page).to have_content 'iso 3 20' 
      expect(page).to have_content 'Karhu 15' 
      expect(page).not_to have_content 'iso 3 30' 
      expect(page).not_to have_content 'Karhu 40' 
    end 
  end
end