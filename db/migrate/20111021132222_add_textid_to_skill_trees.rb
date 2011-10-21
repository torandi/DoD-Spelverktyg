class AddTextidToSkillTrees < ActiveRecord::Migration
  def self.up
    add_column :skill_trees, :textid, :string
  end

  def self.down
    remove_column :skill_trees, :textid
  end
end
