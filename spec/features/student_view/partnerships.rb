require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature 'partnership requests' do
  
  before(:each) do
    professor = FactoryGirl.create(:professor)
    login_as(professor, :scope => :user)
    visit(roster_path)
    first_week_roster = Rails.root + "SQL\ and\ CSVs/rspec_csvs/5\ students.csv"
    attach_file('dump_file', first_week_roster, visible: false)
    click_button 'Upload CSV File'
  end
  
  scenario 'should be recieved by receiving student' do
    student1 = FactoryGirl.create(:student1)
    student2 = FactoryGirl.create(:student2)
    login_as(student1, :scope => :user)
    visit("/users/#{student2.id}/send_request") # send a partner_request to id student1
    login_as(student2, :scope => :user)
    visit(root_path)
    expect(page).to have_content("#{student1.first_name} d #{student2.first_name}")
    
    
    
    
  end
  
end

