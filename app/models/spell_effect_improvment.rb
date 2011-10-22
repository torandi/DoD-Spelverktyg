class SpellEffectImprovment < ActiveRecord::Base
  belongs_to :spell_effect
  belongs_to :spell

end
