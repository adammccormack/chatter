require 'rails_helper'

class Home
  include Capybara::DSL
  def visit_homepage
    visit('/')
  end
end

feature 'Posting a message' do
  let(:home) {Home.new}
  scenario 'User can post a noise to homepage' do
    home.visit_homepage

    fill_in('content', with: 'hola hola')
    click_button('Submit')

    expect(page).to have_content 'hola hola'
  end
end

feature 'Viewing messages' do
  let(:home) {Home.new}
  scenario 'Noises are visible on the homepage' do
    home.visit_homepage

    fill_in('content', with: 'hola hola')
    click_button('Submit')
    fill_in('content', with: 'whaddup')
    click_button('Submit')
    fill_in('content', with: 'yowza')
    click_button('Submit')
    
    
  end
end

# I can expect to visit the homepage
# I can expect to see yowza first
# I can expect to see hola hola last
