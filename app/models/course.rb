class Course < ActiveRecord::Base
	has_many :projects
	has_many :users, :through=> :rosters
	has_many :groups, :through=> :projects
	has_many :rosters
	 
end
