require 'rails_helper'

class Home
  include Capybara::DSL
  def visit_homepage
    visit('/')
  end
end

# feature "Visit homepage" do
#   let(:home) {Home.new}
#   scenario "Able to see text, Word Nerds", :js => true do
#     home.visit_homepage
#     expect(page).to have_content("Word Nerds")
#   end
# end

# I can expect to be on the homepage
# I can expect to see a text box
# I can expect to see a submit button
# I can expect when I click the submit button to see the post in the homepage

feature 'Posting a message' do
  let(:home) {Home.new}
  scenario 'User can post a noise (message) to Homepage'do
    home.visit_homepage

    fill_in('content', with: 'hola hola')
    click_button('Submit')

    expect(page).to have_content 'hola hola'
  end
end
