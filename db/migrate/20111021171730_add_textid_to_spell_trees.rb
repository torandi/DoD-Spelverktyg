class AddTextidToSpellTrees < ActiveRecord::Migration
  def self.up
    add_column :spell_trees, :textid, :string
  end

  def self.down
    remove_column :spell_trees, :textid
  end
end
