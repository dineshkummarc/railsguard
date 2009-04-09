require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Ship do
  before(:each) do
    @ship = Ship.make()
  end

  it "should create a new instance given valid attributes" do
    @ship.should be_valid   
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
  
  it "should limit the jump drive according to tech_level" do
    @ship = Ship.make(:tech_level => 11, :jumpdrive => 5)
    @ship.max_jumpdrive.should == 2
    @ship.jumpdrive.should == 2
  end
  
  it "should not have a jumpdrive greater than the powerplant" do
    @ship = Ship.make(:jumpdrive => 6, :tech_level => 15)
    @ship.power.should >= 6
  end

end
