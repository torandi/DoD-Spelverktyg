class SpellEffect < ActiveRecord::Base
  belongs_to :spell
  has_many :improvments, :class_name=>"SpellEffectImprovment"

  def to_s
    name
  end
end
