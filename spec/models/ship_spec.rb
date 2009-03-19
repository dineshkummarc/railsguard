require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Ship do
  before(:each) do
    @valid_attributes = {
      :name => 'big ship',
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Ship.create!(@valid_attributes)
  end
end
