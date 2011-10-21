class CreateSpells < ActiveRecord::Migration
  def self.up
    create_table :spells do |t|
      t.string :name
      t.text :description
      t.integer :spell_tree_id
      t.integer :level
      t.enum :spelltype, :limit=>[:instant, :lasting, :permanent, :sustained], :default=>:instant, :null=>false
      t.integer :duration
      t.string :duration_unit, :default=>""
      t.integer :range
      t.integer :weave_time
      t.integer :initative

      t.timestamps
    end
  end

  def self.down
    drop_table :spells
  end
end
