require 'rails_helper'

feature "User signs up for app" do
  scenario "successfully" do
    visit new_user_registration_path
    expect(page).to have_css 'h1', text:'Sign up'
  end
end