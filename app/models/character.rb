class Character < ActiveRecord::Base
  after_create :create_skills

  belongs_to :user
  belongs_to :party

  has_many :skill_levels, :class_name=>"CharacterSkillLevel"
  has_many :skills, :class_name=>"CharacterSkill"

  accepts_nested_attributes_for :skill_levels

  def skill_level(skill_tree_id)
    csl = skill_levels.find_by_skill_tree_id(skill_tree_id)
    if csl
      csl.level
    else
      0
    end
  end

  def to_s
    name
  end
  
  def has_skill?(skill)
    skills.find_by_skill_id(skill.id)
  end

  private
  def create_skills
    SkillTree.all.each do |tree|
      CharacterSkillLevel.create(:character_id=>self.id, :skill_tree_id=>tree.id, :level=>0)
    end
  end
end
