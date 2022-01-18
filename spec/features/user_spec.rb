require 'rails_helper'


feature 'New User' do
  scenario 'User can sign up' do
    visit('/users')

    fill_in('first_name', with: 'Greg')
    fill_in('last_name', with: 'Egg')
    fill_in('email', with: 'gregegg@email.com')
    fill_in('password', with: '12345')
    click_button('Sign Up')

    expect(User.last.first_name).to eq('Greg')
  end
end


feature 'authentication' do
  scenario 'User can sign in' do
    User.create(email: 'test@email.com', password: 'password123')

    visit ('/sessions/new')
    fill_in(:email, with: 'test@email.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content('Welcome, test@email.com')
  end
end