class Ship < ActiveRecord::Base     
  
  validates_presence_of :name, :tonnage, :tech_level
  
  def smallcraft
    tonnage < 100 ? true : false
  end
  
end
