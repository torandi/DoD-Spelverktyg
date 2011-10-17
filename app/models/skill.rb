class Skill < ActiveRecord::Base
  belongs_to :skill_tree
  belongs_to :attribute, :foreign_key=>"attr"
  belongs_to :dependency, :class_name=>"Skill"

  scope :level , lambda { |level| where("level = ?", level) }
  scope :skill_tree , lambda { |tree| where("skill_tree_id = ?", tree) }

  def to_s
    name
  end

  def specialized?
    class_limited
  end

  def calc(x)
    f = formula.gsub(/x/,"#{x}")
    lambda { |f| $SAFE=4;  return eval(f).to_int }.call(formula)
  end
end
