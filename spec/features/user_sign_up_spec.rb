require 'rails_helper'

feature "User signs up for app" do
  scenario "successfully" do
    visit new_user_registration_path

    expect(page).to have_css 'h1', text:'Sign up'

    within("form#new_user.new_user") do
      fill_in "user_username", with: "Username"
      fill_in "Email", with:"user@email.com"
      fill_in "user_password", with:"password"
      fill_in "user_password_confirmation", with:"password"
      fill_in "user_bio", with:"My user bio"
  
      click_on "commit"
    end


    expect(User.count).to eq(1)

    expect(User.first.username).to eq("Username")
    expect(User.first.email).to eq("user@email.com")
    expect(User.first.bio).to eq("My user bio")
  end
end