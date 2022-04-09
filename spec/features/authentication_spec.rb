# frozen_string_literal: true

require 'rails_helper'

feature 'authentication' do
  scenario 'a user can sign in' do
    User.create(username: 'test_user', email: 'test@email.com', password: 'password123')

    visit('/login')
    fill_in('Username', with: 'test_user')
    fill_in('Email', with: 'test@email.com')
    fill_in('Password', with: 'password123')
    click_button('Sign in')

    expect(page).to have_content('Welcome, test_user')
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(username: 'test_user', email: 'test@email.com', password: 'password123')

    visit('/login')
    
    fill_in('Username', with: 'test_user')
    fill_in('Email', with: 'wrongemail@email.com')
    fill_in('Password', with: 'password123')
    click_button('Sign in')

    expect(page).to have_content('Wrong username or passsword.')
  end
end



