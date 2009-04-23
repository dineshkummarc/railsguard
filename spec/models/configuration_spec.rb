require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Configuration do
  before(:each) do
    @configuration = Configuration.make()
  end

  it "should create a new instance given valid attributes" do
    @configuration.should be_valid   
  end 
    
  #This is where the real tests start
  
end