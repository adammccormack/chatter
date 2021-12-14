# frozen_string_literal: true

require 'rails_helper'

feature 'Homepage' do
  scenario 'User can post a noise to homepage' do
    visit('/')

    fill_in('content', with: 'hola hola')
    click_button('Submit')

    expect(page).to have_content 'hola hola'
  end

  scenario "Posts are posted in reverse chronological order" do
    visit('/')

    fill_in('content', with: 'hi')
    click_button('Submit')
    fill_in('content', with: 'hello')
    click_button('Submit')
    fill_in('content', with: 'bye')
    click_button('Submit')

    rows_array = page.all("td.td-content").each do |td|
      td.text
    end
    
    expect(rows_array[0].text).to have_content 'bye'
    expect(rows_array[2].text).to have_content 'hi'
  end
end
