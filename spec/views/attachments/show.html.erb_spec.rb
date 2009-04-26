require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/attachments/show.html.erb" do
  include AttachmentsHelper
  before(:each) do
    assigns[:attachment] = @attachment = stub_model(Attachment)
  end

  it "renders attributes in <p>" do
    render
  end
end

