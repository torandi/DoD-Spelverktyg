class Attribute < ActiveRecord::Base
  has_many :skills, :primary_key=>"text_id", :foreign_key=>"attr"


  # Limitation är aktiv vitnertavla, vapen eller dyl
  def value(limitation=nil)
    if type == 0
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
end
