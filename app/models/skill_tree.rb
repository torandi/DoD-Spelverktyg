# -*- encoding: utf-8 -*-

class SkillTree < ActiveRecord::Base
  has_many :skills

  def class_model
    Kernel.const_get(skill_model)
  end

  def safe_name
    name.gsub(/ /,"_").gsub(/[åä]/,"a").gsub(/ö/,"o").downcase
  end

  def to_s
    name
  end
end
