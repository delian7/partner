require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature 'professor student view' do
  
  before(:each) do
    professor = FactoryGirl.create(:professor)
    login_as(professor, :scope => :user)
    visit (root_path)
    first_week_roster = Rails.root + "SQL\ and\ CSVs/rspec_csvs/first_week_roster.csv"
    attach_file('fileupload', first_week_roster)
    find_button('csvbutton', disabled: true).click
  end

  
  scenario 'assigning students should move them to the correct team' do
    
  end
  
end

