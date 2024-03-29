class CreateCharacterSkills < ActiveRecord::Migration
  def self.up
    create_table :character_skills do |t|
      t.integer :character_id
      t.integer :skill_id
      t.integer :specialization_id

      t.timestamps
    end
  end

  def self.down
    drop_table :character_skills
  end
end
