class AddConfigurationId < ActiveRecord::Migration
  def self.up
    add_column :ships, :configuration_id, :integer
  end

  def self.down
    remove_column :ships, :configuration_id
  end
end
