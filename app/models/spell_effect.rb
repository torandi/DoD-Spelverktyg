class SpellEffect < ActiveRecord::Base
  belongs_to :spell
  belongs_to :attr, :foreign_key=>:attribute_id, :class_name=>"Attribute"

  has_many :improvments, :class_name=>"SpellEffectImprovment"

  def to_s
    name
  end


end
