class AddAttributeIdToSpellEffects < ActiveRecord::Migration
  def self.up
    add_column :spell_effects, :attribute_id, :integer
  end

  def self.down
    remove_column :spell_effects, :attribute_id
  end
end
