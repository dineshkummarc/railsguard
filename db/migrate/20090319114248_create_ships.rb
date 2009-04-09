class CreateShips < ActiveRecord::Migration
  def self.up
    create_table :ships do |t|
      t.string :name
      t.text :description
      t.integer :tonnage, :null => false, :default => 0
      t.integer :tech_level, :null => false, :default => 0    
      t.integer :jumpdrive, :null => false, :default => 0
      t.integer :thrust, :null => false, :default => 0 
      t.integer :power, :null => false, :default => 0  
      t.integer :staterooms, :null => false, :default => 0
      t.integer :troops, :null => false, :default => 0    
      t.timestamps
    end
  end

  def self.down
    drop_table :ships
  end
end
