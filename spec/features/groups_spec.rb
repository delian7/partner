require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature 'groups:' do
  
  before(:each) do
      professor = FactoryGirl.create(:professor)
      login_as(professor, :scope => :user)
      visit(roster_path)
      first_week_roster = Rails.root + "SQL\ and\ CSVs/rspec_csvs/first_week_roster.csv"
      attach_file('dump_file', first_week_roster, visible: false)
      click_button 'Upload CSV File'
  end
  
  scenario 'autogroup should create group size based off project size' do
    visit(groups_path)
  end
  
  
end

