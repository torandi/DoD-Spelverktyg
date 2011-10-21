class AddFieldsToSpellTrees < ActiveRecord::Migration
  def self.up
    add_column :spell_trees, :description, :text
    add_column :spell_trees, :negations, :text
    add_column :spell_trees, :vitner, :text
  end

  def self.down
    remove_column :spell_trees, :vitner
    remove_column :spell_trees, :negations
    remove_column :spell_trees, :description
  end
end
