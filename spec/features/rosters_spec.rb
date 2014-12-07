require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature 'roster uploads' do
  
  before(:each) do
      professor = FactoryGirl.create(:professor)
      login_as(professor, :scope => :user)
      visit(roster_path)
      first_week_roster = Rails.root + "SQL\ and\ CSVs/rspec_csvs/first_week_roster.csv"
      attach_file('dump_file', first_week_roster, visible: false)
      click_button 'Upload CSV File'
  end
  
  scenario 'should add students, a course, and a new project' do
    visit(users_path)
    expect(page).to have_content 'Phylis Jesse' # checks for the name in the roster upload
    visit(courses_path)
    expect(page).to have_content 'In4matx 191A, Sec. A, Lecture'
    visit(projects_path)
    expect(page).to have_content 'In4matx 191A Sec. A - New Project'
  end
    
  scenario 'delete people that are not in the new roster from the course' do
    second_week_roster = Rails.root + "SQL\ and\ CSVs/rspec_csvs/second_week_roster.csv"
    one_person_roster = Rails.root + "SQL\ and\ CSVs/rspec_csvs/one_person_roster.csv"
    
    visit(roster_path)
    attach_file('dump_file', second_week_roster, visible: false)
    click_button 'Upload CSV File'
    visit(users_path)
    # since name is not in new roster, new course should not have have the name
    expect(page).not_to have_content("Phylis Jesse")
    visit(roster_path)
    # further deletion of students
    attach_file('dump_file', one_person_roster, visible: false)
    click_button 'Upload CSV File'
    visit(users_path)
    expect(page).not_to have_content("Pearly Kays") 
  end
  
end

