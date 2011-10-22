class AddSpellIdToSpellEffectImprovments < ActiveRecord::Migration
  def self.up
    add_column :spell_effect_improvments, :spell_id, :integer
  end

  def self.down
    remove_column :spell_effect_improvments, :spell_id
  end
end
