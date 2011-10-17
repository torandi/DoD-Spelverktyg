class ChangeDescriptionsToText < ActiveRecord::Migration
  def self.up
    change_column :skills, :description, :text
  end

  def self.down
    change_column :skills, :description, :string
  end
end
