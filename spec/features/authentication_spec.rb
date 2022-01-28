# frozen_string_literal: true

require 'rails_helper'

feature 'authentication' do
  scenario 'a user can sign in' do
    User.create(email: 'test@email.com', password: 'password123')

    visit('/login')
    fill_in('Email', with: 'test@email.com')
    fill_in('Password', with: 'password123')
    click_button('Sign in')

    expect(page).to have_content('Welcome, test@email.com')
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(email: 'test@email.com', password: 'password123')

    visit('/login')
    fill_in('Email', with: 'wrongemail@email.com')
    fill_in('Password', with: 'password123')
    click_button('Sign in')

    #expect(page).not_to have_content('Welcome, test@email.com')
    expect(page).to have_content('Please check your email or password')
  end
end
