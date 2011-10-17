class CreateSkills < ActiveRecord::Migration
  def self.up
    create_table :skills do |t|
      t.string :name
      t.string :description
      t.integer :skill_tree_id
      t.integer :level
      t.string :attribute
      t.string :formula

      t.timestamps
    end
  end

  def self.down
    drop_table :skills
  end
end
