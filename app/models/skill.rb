class Skill < ActiveRecord::Base
  belongs_to :skill_tree
  belongs_to :attribute, :foreign_key=>"attr", :primary_key=>"text_id"
end
