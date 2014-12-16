require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature 'autogroup:' do
  
  before(:each) do
      professor = FactoryGirl.create(:professor)
      login_as(professor, :scope => :user)
      # uploads roster to populate students
      visit(roster_path)
      first_week_roster = Rails.root + "SQL\ and\ CSVs/rspec_csvs/first_week_roster.csv"
      attach_file('roster_upload', first_week_roster, visible: false)
      click_button 'Upload CSV File'
      # autogroups teams
      visit(groups_path)
      click_button('autogroup-btn')
      # group statistics
      @project = Project.find_by_name('In4matx 191A  Sec. A - New Project')
      @number_of_groups = all('table').size 
  end
  
  scenario 'should create group size based off project size' do
    expect(page).to have_selector('#group1 td:nth-child(2)', count: @project.group_size)
  end
  
  scenario 'disbanning first group should decrement number of groups by 1' do
    all(:xpath, '//*[(@id = "disband-group-btn")]')[0].click
    expect(page).to have_selector('table', count: @number_of_groups - 1)
  end
  
  scenario 'disbanning all groups should reduce number of groups to 0' do 
    click_link('disband-all-btn')
    expect(page).to have_selector('table', count: 0)
  end
  
  scenario 'should create number of teams by dividing number of students by project_size' do #TODO only even numbered students
    number_of_students = page.all('td#name').size    
    expect(page).to have_selector('table', count: number_of_students / @project.group_size)
  end
  
  scenario 'assigning student to new team' do #TODO JAVASCRIPT DOESN'T WORK
    
    page.all('td#name').map(&:text)
    student = page.all('td#name').map(&:text)[0]
    selected_group = first('select#team-select').find(:xpath, 'option[1]').text
    first('select#team-select').find(:xpath, 'option[1]').select_option # move the student to the first team possible
    page.all('td#name').map(&:text)
    
  end
  

end

