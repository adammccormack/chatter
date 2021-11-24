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

# feature "Homepage displays messages" do
#   let(:home) {Home.new}
#   scenario "When on Homepage" do
#     message = Message.create(user_id: 1, content: 'hello there')

#     home.visit_homepage
#     expect(page).to have_content('hello there')
#   end
# end

feature 'Viewing posts' do
  let(:home) {Home.new}
  scenario 'A user can see all posts' do
    home.visit_homepage
    
   
    expect(page).to have_content 'oh hai'
    expect(page).to have_content 'hallooo'
    expect(page).to have_content 'awkwooord'
  end
end
