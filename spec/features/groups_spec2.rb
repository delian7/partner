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
      attach_file('dump_file', first_week_roster, visible: false)
      click_button 'Upload CSV File'
      # autogroups teams
      visit(groups_path)
      click_button('autogroup-btn')
      # group statistics
      @project = Project.find_by_name('In4matx 191A  Sec. A - New Project')
      @number_of_groups = all('table').size 
  end
  
  scenario 'should create number of teams by dividing number of students by project_size' do
    
    find('select#team-select-btn-person3').find(:xpath, 'option[2]').select_option
    
  end
end

