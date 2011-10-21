class Character < ActiveRecord::Base
  after_create :create_skills

  belongs_to :user
  belongs_to :party

  has_many :skill_levels, :class_name=>"CharacterSkillLevel"
  has_many :skills, :class_name=>"CharacterSkill"

  accepts_nested_attributes_for :skill_levels

  scope :accessible_by, lambda { |user| 
    if user.admin?
      all
    else
      find_by_user(user)
    end
  }

  def skill_level_from_text_id(text_id)
    skill_level(SkillTree.find_by_textid(text_id).id)
  end 

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

  def attr_value(attribute,calc_path = [], limitation=nil, base=nil) 
    Attribute.find_by_text_id(attribute).value(self,calc_path, limitation, base)
  end

  private
  def create_skills
    SkillTree.all.each do |tree|
      CharacterSkillLevel.create(:character_id=>self.id, :skill_tree_id=>tree.id, :level=>0)
    end
  end
end
