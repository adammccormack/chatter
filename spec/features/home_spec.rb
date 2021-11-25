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


feature 'Viewing posts' do
  let(:home) {Home.new}
  scenario 'A user can see all posts' do
    home.visit_homepage
    
    expect(page).to have_content 'oh hai'
    expect(page).to have_content 'hallooo'
    expect(page).to have_content 'wow'
  end
end
