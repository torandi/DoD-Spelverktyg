class CharacterSkillLevel < ActiveRecord::Base
  belongs_to :character
  belongs_to :skill_tree
end
