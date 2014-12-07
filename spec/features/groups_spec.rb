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
      @project = Project.find_by_name('In4matx 191A  Sec. A - New Project')
      # group statistics
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
end

