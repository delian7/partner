require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature 'autogroup:' do

  before(:each) do
    professor = FactoryGirl.create(:professor)
    login_as(professor, :scope => :user)
    visit (root_path)
    first_week_roster = Rails.root + "SQL\ and\ CSVs/rspec_csvs/first_week_roster.csv"
    attach_file('fileupload', first_week_roster)
    find_button('csvbutton', disabled: true).click
    # autogroups teams
    visit(groups_path)
    find_by_id('autogroup-btn').click
    # save_and_open_page
    # group statistics
    @project = Project.find_by_name('37200 - Project')
    @number_of_groups = all('table').size
  end

  # scenario 'should create group size based off project size' do
  #   expect(page).to have_selector('#group1 td:nth-child(2)', count: @project.group_size)
  # end

  scenario 'disbanning first group should decrement number of groups by 1' do
    all(:xpath, '//*[(@id = "disband-group-btn")]')[0].click
    expect(page).to have_selector('table', count: @number_of_groups - 1)
  end

  scenario 'disbanning all groups should reduce number of groups to 0' do
    click_link('disband-all-btn')
    # count set to 1 to account for table header
    expect(page).to have_selector('table', count: 1)
  end

  scenario 'should create number of teams by dividing number of students by project_size' do #TODO only even numbered students
    number_of_students = page.all('td#name').size
    expected_num_groups = (number_of_students.to_f / @project.group_size).ceil
    # students divided by group size, plus the table header
    expect(page).to have_selector('table', count: expected_num_groups + 1)
  end

  # scenario 'assigning student to new team' do #TODO JAVASCRIPT DOESN'T WORK

  #   page.all('td#name').map(&:text)
  #   student = page.all('td#name').map(&:text)[0]
  #   selected_group = first('select#team-select').find(:xpath, 'option[1]').text
  #   first('select#team-select').find(:xpath, 'option[1]').select_option # move the student to the first team possible
  #   page.all('td#name').map(&:text)

  # end


end
