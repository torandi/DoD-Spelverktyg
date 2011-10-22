class Spell < ActiveRecord::Base
  has_many :effects, :class_name => "SpellEffect", :dependent=>:destroy
  has_many :improvments, :class_name => "SpellEffectImprovment", :dependent=>:destroy

  belongs_to :spell_tree

  scope :level, lambda {|level| where("level = ?", level)}

  accepts_nested_attributes_for :improvments, :effects, :reject_if => lambda { |a| a[:name].blank? && a[:description].blank? }, :allow_destroy=>true

  def cost 
    case level
      when 1
        2
      when 2
        4
      when 3
        6
      when 4
        8
      when 5
        10
    end
  end

  def to_s
    "#{level}: #{name}"
  end
end
