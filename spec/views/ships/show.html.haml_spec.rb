require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/ships/show.html.haml" do
  include ShipsHelper
  before(:each) do
    assigns[:ship] = @ship = stub_model(Ship,
      :name => 'big ship',
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_tag( "p.description", :text => "value for description" )
  end
end

