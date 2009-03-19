require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/ships/index.html.erb" do
  include ShipsHelper
  
  before(:each) do
    assigns[:ships] = [
      stub_model(Ship,
        :name => 'big ship',
        :description => "value for description"
      ),
      stub_model(Ship,
        :name => 'big ship',
        :description => "value for description"
      )
    ]
  end

  it "renders a list of ships" do
    render
    response.should have_tag("tr>td", 'big ship', 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end

