require 'rails_helper'


feature 'New User' do
  scenario 'User can sign up' do
    visit('/users')

    fill_in('First_name', with: 'Greg')
    fill_in('Last_name', with: 'Egg')
    fill_in('Email', with: 'gregegg@email.com')
    fill_in('Password', with: '12345')
    click_button('Submit')

    expect(page).to have_content 'Welcome, gregegg@email.com'
  end
end