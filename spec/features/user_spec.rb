require 'rails_helper'


feature 'New User' do
  scenario 'User can sign up' do
    visit('/users/new')

    fill_in('content', with: 'gregegg@email.com')
    fill_in('content', with: '12345')
    click_button('Submit')

    expect(page).to have_content 'Welcome, gregegg@email.com'
  end
end