require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/ships/delete.html.haml" do
  include ShipsHelper
  before(:each) do
    assigns[:ship] = @ship = Ship.make
  end

  it "renders delete ship form" do
    render  
    response.should have_tag("form[action=?][method=post]", ship_path(@ship)) do
      with_tag("input[type=submit][value=Delete]")  
    end
  end
end