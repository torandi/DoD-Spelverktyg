class SpellTree < ActiveRecord::Base
  has_many :spells

  def self.model_name
    "Vitnertavla"
  end

  def to_s
    name
  end
end
