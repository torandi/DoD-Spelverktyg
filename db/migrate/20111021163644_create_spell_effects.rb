class CreateSpellEffects < ActiveRecord::Migration
  def self.up
    create_table :spell_effects do |t|
      t.integer :spell_id
      t.string :name
      t.enum :output_type, :limit=>[:normal, :turns, :time, :dice, :reach], :default=>:normal, :nil=>false
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :spell_effects
  end
end
