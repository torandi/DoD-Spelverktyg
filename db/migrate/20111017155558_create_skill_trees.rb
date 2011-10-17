class CreateSkillTrees < ActiveRecord::Migration
  def self.up
    create_table :skill_trees do |t|
      t.string :name
      t.string :skill_model

      t.timestamps
    end
  end

  def self.down
    drop_table :skill_trees
  end
end
