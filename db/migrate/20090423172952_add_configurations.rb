class AddConfigurations < ActiveRecord::Migration
  def self.up
    Configuration.create :name => 'Wedge', :modifier => '1.2', :streamlined => true
    Configuration.create :name => 'Cone', :modifier => '1.1', :streamlined => true
    Configuration.create :name => 'Cylinder', :modifier => '1', :streamlined => false
    Configuration.create :name => 'Close Structure', :modifier => '0.6', :streamlined => true
    Configuration.create :name => 'Sphere', :modifier => '0.7', :streamlined => true
    Configuration.create :name => 'Flattened Sphere', :modifier => '0.8', :streamlined => true
    Configuration.create :name => 'Dispersed Structure', :modifier => '0.5', :streamlined => true
  end

  def self
    Configuration.find(:all).each do |c|
      c.destroy
    end
  end
end
