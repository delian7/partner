require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

# Feature: Sign in
#   As a user
#   I want to sign in
#   So I can visit protected areas of the site
feature 'navigation to project page' do
  scenario 'professor should be able to go to the project page' do
    user = FactoryGirl.create(:professor)
    visit(projects_path)
    expect(page).to have_content 'Add New Project'
  end  
end

feature 'roster upload should populate students' do
  scenario 'students from roster upload should be in the list of students' do
    user = FactoryGirl.create(:student)
    roster = FactoryGirl.create(:roster)
    login_as(user, :scope => :user)
    visit(users_path)
    find('#user_current_course')
    
    
    
    
    
    
  
    
    expect(page).to have_content 'Selected course:'
    
  end
end

