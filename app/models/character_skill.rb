class CharacterSkill < ActiveRecord::Base
  belongs_to :character
  belongs_to :skill

  validates_uniqueness_of :character_id , :scope=>[:skill_id, :specialization_id]

  scope :level , lambda { |level| joins(:skill).where("skills.level = ?", level) }
  scope :skill_tree , lambda { |tree| joins(:skill).where("skills.skill_tree_id = ?", tree) }

  scope :attr, lambda {|attr| joins(:skill).where("skills.attr = ?", attr) }

  def to_s
    if specialization_id
      "#{skill.name} (#{specialization})"
    else
      "#{skill.name}" 
    end
  end

  def specialization
    "spec: #{specialization_id}"
  end
end
