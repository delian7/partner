require 'rails_helper'

# Feature: Sign in
#   As a user
#   I want to sign in
#   So I can visit protected areas of the site
feature 'autogroup size requirement' do
  scenario 'autogroup generates groups of specified project size' do
    
    visit project_path
    expect(page).to have_content 'Add New Project'

    
  end
end

