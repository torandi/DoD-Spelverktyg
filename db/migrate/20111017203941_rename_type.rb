class RenameType < ActiveRecord::Migration
  def self.up
    rename_column :attributes, :type, :output_type
  end

  def self.down
    rename_column :attributes, :output_type, :type
  end
end
