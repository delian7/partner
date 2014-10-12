class Course < ActiveRecord::Base
	# has_many :users, :through => :rosters
	# has_many :groups, :through => :projects
	# has_many :rosters
	# has_many :projects
	 has_and_belongs_to_many :users
	 has_and_belongs_to_many :groups
end
