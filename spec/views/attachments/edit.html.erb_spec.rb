require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/attachments/edit.html.erb" do
  include AttachmentsHelper
  
  before(:each) do
    assigns[:attachment] = @attachment = stub_model(Attachment,
      :new_record? => false
    )
  end

  it "renders the edit attachment form" do
    render
    
    response.should have_tag("form[action=#{attachment_path(@attachment)}][method=post]") do
    end
  end
end


