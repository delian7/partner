require 'rails_helper'
require "selenium-webdriver"


include Warden::Test::Helpers
Warden.test_mode!

feature 'course projects:' do
  
  
  before(:each) do
      professor = FactoryGirl.create(:professor)
      login_as(professor, :scope => :user)
      visit(roster_path)
      first_week_roster = Rails.root + "SQL\ and\ CSVs/rspec_csvs/first_week_roster.csv"
      attach_file('dump_file', first_week_roster)
      page.find('#upload-roster').click
  end
  
  scenario 'only professor should be able to go to the project page' do #TODO:only professor
    visit(projects_path)
    page.body
    expect(page).to have_content 'Add New Project'
  end  
  
  scenario 'creating test project and deleting the test project' do
    
    # addition of the test project
    visit(projects_path)
    all(:xpath, '//*[(@id = "add-new-project")]')[0].click
    fill_in('project_name', with: 'Test Project')
    select('In4matx 191A, Sec. A, Lecture', from: 'project_course_id')
    click_button ("save-project")
    visit(projects_path)
    expect(page).to have_content('Test Project')
    # deletion of the test project
    visit(projects_path)
    project_id = Project.find_by_name("Test Project").id
    click_link ("delete-#{project_id}")
    expect(page).not_to have_content('Test Project')
  end
  
  scenario 'creating 10 new projects & deleting the projects' do
    visit(projects_path)
    for i in (0..10) 
      all(:xpath, '//*[(@id = "add-new-project")]')[0].click
      fill_in('project_name', with: "Test Project #{i}")
      select('In4matx 191A, Sec. A, Lecture', from: 'project_course_id')
      click_button ("save-project")
    end
    expect(page).to have_content ("Test Project 10")
    
    for i in (0..10)
      project_id = Project.find_by_name("Test Project #{i}").id
      click_link ("delete-#{project_id}")
    end
    expect(page).not_to have_content ("Test Project 10")
  end

end

