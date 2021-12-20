require 'rails_helper'

feature 'New User' do
  scenario 'User can sign up' do
    visit('/users/new/')

    fill_in('first_name', with: 'Greg')
    fill_in('last_name', with: 'Egg')
    fill_in('email', with: 'gregegg@email.com')
    fill_in('password', with: '12345')
    click_button('Submit')

    expect(page).to have_content 'Welcome, gregegg@email.com'
  end
end