require 'rails_helper'

feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'test@email.com', password: 'password123')

    visit('/sessions/new')
    fill_in(:email, with: 'test@email.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content('Welcome, test@email.com')
  end
end

