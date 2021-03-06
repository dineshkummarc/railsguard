require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/ships/new.html.haml" do
  include ShipsHelper
  
  before(:each) do
    assigns[:ship] = stub_model(Ship,
      :new_record? => true,
      :name => 'new ship',
      :description => "value for description"
    )
  end

  it "renders new ship form" do
    render
    
    response.should have_tag("form[action=?][method=post]", ships_path) do
      with_tag('input#ship_name[name=?]', "ship[name]")
      with_tag('textarea#ship_description[name=?]', "ship[description]") 
      with_tag('select#ship_configuration_id[name=?]', "ship[configuration_id]")    
      with_tag("select#ship_tech_level[name=?]", "ship[tech_level]")   
      with_tag("textarea#ship_description[name=?]", "ship[description]")  
      with_tag("input[type=submit][value=Create]")
    end    
  end
end


