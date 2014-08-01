class Project < ActiveRecord::Base
   has_many :groups, :through=>:evaluations
   has_many :evaluations
   belongs_to :group
   belongs_to :course
end
