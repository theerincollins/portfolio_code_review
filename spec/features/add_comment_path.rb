require 'rails_helper'

describe 'add comments path' do
  it 'displays the add comment form on posts page', js: true do
    visit "/users/sign_up"
    fill_in 'Email', :with => 'MommaMia@email.com'
    fill_in 'Username', :with => 'MommaMia'
    fill_in 'Password', :with => 'whoayes123'
    fill_in 'Password confirmation', :with => 'whoayes123'
    click_button 'Sign up'

    click_on 'Logout'
    visit new_user_session_path
    fill_in 'Email', :with => 'MommaMia@email.com'
    fill_in 'Password', :with => 'whoayes123'
    click_on 'Log in'

    post = Post.create(:title "this is a title", :description "there is a description")
    visit posts_path
    click_on 'Add Comment'
    fill_in 'comment_description', :with => 'wow cool'
    click_on 'Create Comment'
    expect(page).to have_content("wow cool")
  end
end
