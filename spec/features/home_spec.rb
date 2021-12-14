# frozen_string_literal: true

require 'rails_helper'

class Home
  include Capybara::DSL
  def visit_homepage
    visit('/')
  end
end

feature 'Posting a message' do
  let(:home) { Home.new }
  scenario 'User can post a noise to homepage' do
    home.visit_homepage

    fill_in('content', with: 'hola hola')
    click_button('Submit')

    expect(page).to have_content 'hola hola'
  end
end

"%I%S %p %d %b %Y"

# feature 'Viewing messages' do
#   let(:home) { Home.new }
#   scenario 'Noises are visible on the homepage in reverse' do
#     home.visit_homepage

#     fill_in('content', with: 'hola hola')
#     click_button('Submit')
#     fill_in('content', with: 'whaddup')
#     click_button('Submit')
#     fill_in('content', with: 'yowza')
#     click_button('Submit')

#     expect('yowza').to appear_before{'hola hola'}
#   end
# end

# RSpec.feature "Timeline", type: :feature do 
#   let(:home) { Home.new }
#   scenario "Posts are posted in reverse chronological order" do
#     home.visit_homepage

#     fill_in('content', with: 'hi')
#     click_button('Submit')
#     fill_in('content', with: 'hello')
#     click_button('Submit')
#     fill_in('content', with: 'bye')
#     click_button('Submit')

#     expect(page.body).to have_selector(:table, '1', rows: [
#       { 'Content' => 'hi' },
#       { 'Content' => 'hello' },
#       { 'Content' => 'bye' }
#     ])
#   end
# end


