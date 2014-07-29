class Project < ActiveRecord::Base
   belongs_to :course
   has_many :evaluations
   has_many :groups
end
