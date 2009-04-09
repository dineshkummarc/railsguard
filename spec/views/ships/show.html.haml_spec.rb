require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/ships/show.html.haml" do
  include ShipsHelper
  before(:each) do
    assigns[:ship] = @ship = Ship.make(:description => "That's no moon.")
  end

  it "renders attributes in a table" do
    render
    response.should have_tag( "tr.description td", :html => "That's no moon." )
  end
end

