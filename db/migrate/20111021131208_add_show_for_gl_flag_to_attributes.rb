class AddShowForGlFlagToAttributes < ActiveRecord::Migration
  def self.up
    add_column :attributes, :show_for_gl, :boolean, :default=>true
  end

  def self.down
    remove_column :attributes, :show_for_gl
  end
end
