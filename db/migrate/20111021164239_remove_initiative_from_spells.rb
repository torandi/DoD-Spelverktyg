class RemoveInitiativeFromSpells < ActiveRecord::Migration
  def self.up
    remove_column :spells, :initative
  end

  def self.down
  end
end
