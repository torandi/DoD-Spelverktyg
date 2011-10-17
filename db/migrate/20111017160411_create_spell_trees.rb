class CreateSpellTrees < ActiveRecord::Migration
  def self.up
    create_table :spell_trees do |t|
      t.string :name
      t.string :hvita_effect
      t.string :vaagri_effect
      t.string :mork_effect

      t.timestamps
    end
  end

  def self.down
    drop_table :spell_trees
  end
end
