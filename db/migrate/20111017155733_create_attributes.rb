class CreateAttributes < ActiveRecord::Migration
  def self.up
    create_table :attributes do |t|
      t.string :name
      t.string :text_id, :null=>false
      t.string :base_formula, :null=>false
      t.integer :type, :null=>false, :default=>0

      t.timestamps

    end
    add_index :attributes, :text_id, :unique=>true
  end

  def self.down
    drop_table :attributes
  end
end
