require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Ship do
  before(:each) do
    @ship = Ship.make()
  end

  it "should create a new instance given valid attributes" do
    @ship.should be_valid   
  end 
  
  # These are really useless tests, just testing that ActiveRecord validations work...  
  # Still I need the practice
  it "should be invalid without a name" do
    @ship.name = nil
    @ship.should_not be_valid   
  end   
  
  it "should be invalid without tech_level" do
    @ship.tech_level = nil
    @ship.should_not be_valid    
  end   
  
  it "should be invalid without tonnage" do
    @ship.tonnage = nil
    @ship.should_not be_valid    
  end  
  
  #This is where the real tests start
  it "should be a smallcraft if tonnage is less than 100" do
    @ship = Ship.make(:tonnage => 99)    
    @ship.smallcraft.should == true
  end  
  
  it "should not be a smallcraft if tonnage is more than 100" do
    @ship = Ship.make(:tonnage => 101)    
    @ship.smallcraft.should == false
  end
  
end
