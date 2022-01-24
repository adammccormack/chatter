require 'rails_helper'

feature 'New User' do
  scenario 'User can sign up' do
    visit('/users/new')

    fill_in('first_name', with: 'Greg')
    fill_in('last_name', with: 'Egg')
    fill_in('email', with: 'gregegg@email.com')
    fill_in('password', with: '12345')
    click_button('Sign Up')

    expect(User.last.first_name).to eq('Greg')
    expect(page).to have_content "Welcome, gregegg@email.com"
  end
end

feature 'authentication' do
  scenario 'User can sign in' do
    visit ('/sessions/new')
    
    fill_in(:email, with: 'test@email.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content('Welcome, test@email.com')
  end
end