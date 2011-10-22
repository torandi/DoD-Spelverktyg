class Skill < ActiveRecord::Base
  belongs_to :skill_tree
  belongs_to :attribute, :foreign_key=>"attr"
  belongs_to :dependency, :class_name=>"Skill"

  scope :level , lambda { |level| where("level = ?", level) }
  scope :skill_tree , lambda { |tree| where("skill_tree_id = ?", tree) }

  def to_s
    "#{level}: #{name}"
  end

  def specialized?
    class_limited
  end

  def calc(x)
    f = formula.gsub(/x/,"#{x}")
    lambda { |f| $SAFE=4;  return eval(f).to_int }.call(formula)
  end

  def required_skill_level
    case level
      when 1
        4
      when 2, 3
        7
      when 4, 5
        10
    end
  end

  def cost 
    case level
      when 1
        4
      when 2
        7
      when 3
        10
      when 4
        14
      when 5
        20
    end
  end
end
