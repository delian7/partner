require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature 'roster uploads' do

  before(:each) do
    professor = FactoryGirl.create(:professor)
    login_as(professor, :scope => :user)
    visit (root_path)
    first_week_roster = Rails.root + "SQL\ and\ CSVs/rspec_csvs/first_week_roster.csv"
    attach_file('fileupload', first_week_roster)
    find_button('csvbutton', disabled: true).click
  end

  # scenario 'should be assesible' do
  #   professor = FactoryGirl.create(:professor)
  #   login_as(professor, :scope => :user)
  #   visit (root_path)
  #   first_week_roster = Rails.root + "SQL\ and\ CSVs/rspec_csvs/first_week_roster.csv"
  #   attach_file('fileupload', first_week_roster)
  #   find_button('csvbutton', disabled: true).click
  #   visit (users_path)
  # end

  scenario 'should add students, a course, and a new project' do
    visit (users_path)
    expect(page).to have_content 'Delian Petrov' # checks for the name in the roster upload
    visit (courses_path)
    expect(page).to have_content 'In4matx 191A, LEC A'
    expect(page).to have_content '37200 - Project'
    expect(page).to have_content 'Spring Quarter, 2014'
  end

    scenario 'roster upload should add correct number of students as in the roster' do
    visit(users_path)
    save_and_open_page
    # first-week-roster has 72 students in it  PLUS 5 for header, name, email etc
    expect(page).to have_selector('td:nth-child(1)', count: 77)
  end

  scenario 'delete people that are not in the new roster from the course' do
    second_week_roster = Rails.root + "SQL\ and\ CSVs/rspec_csvs/second_week_roster.csv"
    one_person_roster = Rails.root + "SQL\ and\ CSVs/rspec_csvs/one_person_roster.csv"

    visit (root_path)
    attach_file('fileupload', second_week_roster, visible: false)
    find_button('csvbutton', disabled: true).click
    visit(users_path)
    # since name is not in new roster, new course should not have have the name
    expect(page).not_to have_content("Phylis Jesse")
    visit (root_path)
    # further deletion of students
    attach_file('fileupload', one_person_roster, visible: false)
    find_button('csvbutton', disabled: true).click
    visit(users_path)
    expect(page).not_to have_content("Pearly Kays")
  end

end
