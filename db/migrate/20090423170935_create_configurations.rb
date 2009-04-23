class CreateConfigurations < ActiveRecord::Migration
  def self.up
    create_table :configurations do |t|
      t.string :name
      t.float :modifier
      t.boolean :streamlined, :null => false, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :configurations
  end
end
