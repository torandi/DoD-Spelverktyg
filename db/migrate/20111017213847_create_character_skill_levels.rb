class CreateCharacterSkillLevels < ActiveRecord::Migration
  def self.up
    create_table :character_skill_levels do |t|
      t.integer :character_id
      t.integer :skill_tree_id
      t.integer :level

      t.timestamps
    end
  end

  def self.down
    drop_table :character_skill_levels
  end
end
