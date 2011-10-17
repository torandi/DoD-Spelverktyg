# -*- encoding: utf-8 -*-

class Attribute < ActiveRecord::Base
  has_many :skills, :foreign_key=>"attr"
  before_create :set_text_id


  # Limitation är aktiv vitnertavla, vapen eller dyl
  def value(limitation=nil)
    if output_type == 0
      calc_value(limitation)
    else
      #Type 1, tarning
      #TODO
      calc_value(limitation)
    end 
  end

  def calc_value(limitation=nil)
    #TODO
  end

  def to_s
    name
  end

  private

  def set_text_id
    self.text_id = self.name.gsub(/ /,"_").gsub(/[åä]/,"a").gsub(/ö/,"o").downcase
  end
end
