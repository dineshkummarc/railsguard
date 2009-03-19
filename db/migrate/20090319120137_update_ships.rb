class UpdateShips < ActiveRecord::Migration
  def self.up     
    rename_column :ships, :title, :name
  end

  def self.down     
    rename_column :ships, :name, :title
  end
end
