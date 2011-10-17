class Skill < ActiveRecord::Base
  belongs_to :skill_tree
  belongs_to :attribute, :foreign_key=>"attr", :primary_key=>"text_id"
  belongs_to :dependency, :class_name=>"Skill"

  scope :level , lambda { |level| where("level = ?", level) }

  def to_s
    name
  end
end
