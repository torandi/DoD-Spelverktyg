class AddDependencyToSkills < ActiveRecord::Migration
  def self.up
    add_column :skills, :dependency_id, :integer
  end

  def self.down
    remove_column :skills, :dependency_id
  end
end
