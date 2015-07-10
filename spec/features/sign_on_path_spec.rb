require 'rails_helper'

describe 'sign in/sign up form path' do
    it "signs a new user up" do
      visit "/users/sign_up"
      fill_in 'Email', :with => 'MommaMia@email.com'
      fill_in 'Username', :with => 'MommaMia'
      fill_in 'Password', :with => 'whoayes123'
      fill_in 'Password confirmation', :with => 'whoayes123'
      click_button 'Sign up'
      expect(page).to have_content "Welcome! You have signed up successfully."

      click_on 'Logout'
      visit new_user_session_path
      fill_in 'Email', :with => 'MommaMia@email.com'
      fill_in 'Password', :with => 'whoayes123'
      click_on 'Log in'
      expect(page).to have_content 'MommaMia'
  end

  it 'gives error on bad login' do
    visit new_user_session_path
    fill_in 'Email', :with => 'MommaMia'
    fill_in 'Password', :with => 'whoayes'
    click_on 'Log in'
    expect(page).to have_content 'Invalid email or password.'
  end
end
