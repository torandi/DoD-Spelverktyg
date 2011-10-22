# -*- encoding: utf-8 -*-

class Attribute < ActiveRecord::Base
  has_many :skills, :foreign_key=>"attr"
  before_create :set_text_id

  # Limitation är aktiv vitnertavla, vapen eller dyl
  # Base är om man ska utgå från annat värde än den beräknade basen (anget i attributet)
  # Calc path fylls i med vägen som togs för uträkningen (reference)
  def value(character,calc_path = [], limitation=nil, base=nil)  
    calc_path.clear
    unless base
      base = base_value(character)
    end
    calc_path << ["Basvärde", "", base]

    value = base

    character.skills.attr(self.id).each do |skill|
      unless skill.skill.specialized? && limitation != skill.specialization_id
        value = skill.skill.calc(value)
        calc_path << [skill.to_s, skill.skill.formula, value]
      end
    end

    value
  end

  def to_s
    name
  end

  def base_value(character)
    formula = base_formula.gsub(/\{(.+?)\}/) do |m|
      character.skill_level_from_text_id($1)
    end
    lambda { |f| $SAFE=4;  return eval(f).to_int }.call(formula)
  end

  private

  def set_text_id
    self.text_id = self.name.gsub(/ /,"_").gsub(/[åä]/,"a").gsub(/ö/,"o").downcase
  end
end
