class AddShipAttributes < ActiveRecord::Migration
  def self.up  
    add_column :ships, :tonnage, :integer    
    add_column :ships, :tech_level, :integer    
    add_column :ships, :jumpdrive, :integer    
    add_column :ships, :thrust, :integer  
    add_column :ships, :power, :integer     
    add_column :ships, :staterooms, :integer 
    add_column :ships, :troops, :integer        
  end

  def self.down  
    remove_column :ships, :tonnage, :integer 
  end
end
