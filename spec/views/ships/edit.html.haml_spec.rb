require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/ships/edit.html.haml" do
  include ShipsHelper
  
  before(:each) do
    assigns[:ship] = @ship = Ship.make
  end

 it "renders the edit ship form" do
   render
   
   response.should have_tag("form[action=#{ship_path(@ship)}][method=post]") do
     with_tag('input#ship_name[name=?]', "ship[name]")
     with_tag('textarea#ship_description[name=?]', "ship[description]") 
     with_tag('select#ship_configuration_id[name=?]', "ship[configuration_id]")    
     with_tag("select#ship_tech_level[name=?]", "ship[tech_level]")   
     with_tag("textarea#ship_description[name=?]", "ship[description]")  
     with_tag("input[type=submit][value=Update]")   
   end   

 end
end


