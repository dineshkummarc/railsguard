require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/attachments/index.html.erb" do
  include AttachmentsHelper
  
  before(:each) do
    assigns[:attachments] = [
      stub_model(Attachment),
      stub_model(Attachment)
    ]
  end

  it "renders a list of attachments" do
    render
  end
end

