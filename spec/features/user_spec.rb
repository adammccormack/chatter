# frozen_string_literal: true

require 'rails_helper'

feature 'New User' do
  scenario 'User can sign up' do
    visit('/signup')

    fill_in('username', with: 'Gman')
    fill_in('first_name', with: 'Greg')
    fill_in('last_name', with: 'Egg')
    fill_in('email', with: 'gregegg@email.com')
    fill_in('password', with: '12345')
    click_button('Sign Up')

    expect(page).to have_content('Welcome, gregegg@email.com')
  end

  scenario 'User can delete their own posts' do
    visit('/login')
    
    fill_in('username', with: 'Gman')
    fill_in('email', with: 'gregegg@email.com')
    fill_in('password', with: '12345')
    click_button('Sign in')
    fill_in('content', with: 'hello there this is my first noise')
    click_button('Submit')
    click_button('delete')

    expect(page).to_not have_content('hello there this is my first noise')
  end
end
