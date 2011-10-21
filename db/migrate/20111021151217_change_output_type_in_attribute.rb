class ChangeOutputTypeInAttribute < ActiveRecord::Migration
  def self.up
    change_column :attributes, :output_type, :enum, :limit=>[:normal,:dice], :default=>:normal
  end

  def self.down
    change_column :attributes, :output_type, :integer, :default=>0
  end
end
