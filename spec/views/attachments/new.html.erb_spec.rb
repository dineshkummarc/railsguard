require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/attachments/new.html.erb" do
  include AttachmentsHelper
  
  before(:each) do
    assigns[:attachment] = stub_model(Attachment,
      :new_record? => true
    )
  end

  it "renders new attachment form" do
    render
    
    response.should have_tag("form[action=?][method=post]", attachments_path) do
    end
  end
end


