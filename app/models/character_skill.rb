# -*- encoding: utf-8 -*-
class CharacterSkill < ActiveRecord::Base
  belongs_to :character
  belongs_to :skill

  validates_uniqueness_of :character_id , :scope=>[:skill_id, :specialization_id], :message=>"Karaktären har redan färdigheten"
  validate :has_dependencies
  validate :has_level

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

  private
  def has_dependencies
    if skill.dependency
      errors[:base] << "Saknar förkunskapskrav #{skill.dependency}" unless character.has_skill?(skill.dependency)
    end
  end

  def  has_level
    errors[:base] << "Kräver #{skill.skill_tree} FV #{skill.required_skill_level}" if character.skill_level(skill.skill_tree_id) < skill.required_skill_level
  end
end
