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
    login_as(user, :scope => :user)
    visit(projects_path)
    expect(page).to have_content 'Add New Project'
  end  
end



feature 'roster upload should populate students' do
  
  before(:each) do
      professor = FactoryGirl.create(:professor)
      login_as(professor, :scope => :user)
    end
  
  scenario 'professor uploads roster for INF191' do
    
    visit(roster_path)
    file_path = Rails.root + "SQL\ and\ CSVs/exampleroster.csv"
    attach_file('dump_file', file_path, visible: false)
    click_button 'Upload CSV File'
    visit(users_path)
    expect(page).to have_content 'Sabina Both'
    visit(courses_path)
    expect(page).to have_content 'In4matx 191A, Sec. A, Lecture'
    visit(projects_path)
    expect(page).to have_content 'In4matx 191A Sec. A - New Project'
  end
    
    
  
  scenario 'students from roster upload should be in the list of students' do
    visit(users_path)
    find('#user_current_course')
        
    expect(page).to have_content 'Selected course:'
    
  end
end

