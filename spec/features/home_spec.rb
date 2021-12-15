# frozen_string_literal: true

require 'rails_helper'

feature 'Homepage' do
  scenario 'User can post a noise to homepage' do
    visit('/')

    fill_in('content', with: 'hola hola')
    click_button('Submit')

    expect(page).to have_content 'hola hola'
  end

  scenario 'Noises are posted in reverse chronological order' do
    visit('/')

    fill_in('content', with: 'hi')
    click_button('Submit')
    fill_in('content', with: 'hello')
    click_button('Submit')
    fill_in('content', with: 'bye')
    click_button('Submit')

    rows_array = page.all('td.td-content').each(&:text)

    expect(rows_array[0].text).to have_content 'bye'
    expect(rows_array[2].text).to have_content 'hi'
  end
end

require 'rails_helper'


# feature 'New User' do
#   scenario 'User can sign up' do
#     visit('/users/new')

#     fill_in('content', with: 'gregegg@email.com')
#     fill_in('content', with: '12345')
#     click_button('Submit')

#     expect(page).to have_content 'Welcome, gregegg@email.com'
#   end
# end
