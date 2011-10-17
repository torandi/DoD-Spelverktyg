class RenameAttributesColumn < ActiveRecord::Migration
  def self.up
    rename_column :skills, :attribute, :attr
  end

  def self.down
    rename_column :skills, :attr, :attribute
  end
end
