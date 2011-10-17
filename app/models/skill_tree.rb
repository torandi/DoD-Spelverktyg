class SkillTree < ActiveRecord::Base
  has_many :skills

  def class_model
    Kernel.const_get(skill_model)
  end
end
