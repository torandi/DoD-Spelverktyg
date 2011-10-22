class CreateSpellEffectImprovments < ActiveRecord::Migration
  def self.up
    create_table :spell_effect_improvments do |t|
      t.integer :spell_effect_id
      t.integer :cost
      t.string :description
      t.enum :effect_type, :limit=>[:normal, :double, :text], :nil=>false
      t.string :formula

      t.timestamps
    end
  end

  def self.down
    drop_table :spell_effect_improvments
  end
end
