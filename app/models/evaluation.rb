class Evaluation < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :group
  has_many :users, :through => :eval_relations
  has_many :projects, :through => :eval_relations
  has_many :groups, :through => :eval_relations
  has_many :eval_relations
end
