require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/ships/edit.html.erb" do
  include ShipsHelper
  
  before(:each) do
    assigns[:ship] = @ship = stub_model(Ship,
      :new_record? => false,
      :name => 'big ship',
      :description => "value for description"
    )
  end

 it "renders the edit ship form" do
   render
   
   response.should have_tag("form[action=#{ship_path(@ship)}][method=post]") do
     with_tag('input#ship_name[name=?]', "ship[name]")
     with_tag('textarea#ship_description[name=?]', "ship[description]")
   end
 end
end


