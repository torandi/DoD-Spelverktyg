# -*- encoding: utf-8 -*-

class Attribute < ActiveRecord::Base
  has_many :skills, :foreign_key=>"attr"
  before_create :set_text_id


  # Limitation är aktiv vitnertavla, vapen eller dyl
  # Base är om man ska utgå från annat värde än den beräknade basen (anget i attributet)
  # Calc path fylls i med vägen som togs för uträkningen (reference)
  def value(character,calc_path = [], limitation=nil, base=nil)
    if output_type == 0
      calc_value(limitation,calc_value, limitation, base)
    else
      #Type 1, tarning
      #TODO
      calc_value(limitation,calc_value, limitation, base)
    end 
  end

  def calc_value(character,calc_path = [], limitation=nil, base=nil)
    #TODO
  end

  def to_s
    name
  end

  def base_value(character)
    formula = base_formula.gsub(/\{(.+?)\}/) do |m|
      character.skill_level($1)
    end
    lambda { |f| $SAFE=4;  return eval(f).to_int }.call(formula)
  end

  private

  def set_text_id
    self.text_id = self.name.gsub(/ /,"_").gsub(/[åä]/,"a").gsub(/ö/,"o").downcase
  end
end
