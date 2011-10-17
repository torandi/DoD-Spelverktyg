class AddClassLimitedToSkill < ActiveRecord::Migration
  def self.up
    add_column :skills, :class_limited, :boolean, :default=>false, :null=>false
  end

  def self.down
  remove_column :skills, :class_limited
  end
end
