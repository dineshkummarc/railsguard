class Configuration < ActiveRecord::Base
  
  has_many :ships
  
  validates_presence_of :name
  
  
end
