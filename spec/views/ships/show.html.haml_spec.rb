require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/ships/show.html.haml" do
  include ShipsHelper
  before(:each) do
    @configuration = Configuration.make(:name => "Sphere")
    # assigns[:configuration] = @configuration 
    assigns[:ship] = @ship = Ship.make(:description => "That's no moon.", :tech_level => '12', 
      :configuration => @configuration )
  end

  it "renders attributes in a table" do
    render
    response.should have_tag( "tr.description td", :html => @ship.description )
    response.should have_tag( "tr.tech_level td", :html => @ship.tech_level )
    response.should have_tag( "tr.configuration td", :html => @configuration.name )
  end
end

