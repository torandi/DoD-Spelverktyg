class Skill < ActiveRecord::Base
  belongs_to :skill_tree
  belongs_to :attribute, :foreign_key=>"attr"
  belongs_to :dependency, :class_name=>"Skill"

  scope :level , lambda { |level| where("level = ?", level) }
  scope :skill_tree , lambda { |tree| where("skill_tree_id = ?", tree) }

  def to_s
    name
  end
end
