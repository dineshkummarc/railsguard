require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AttachmentsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "attachments", :action => "index").should == "/attachments"
    end
  
    it "maps #new" do
      route_for(:controller => "attachments", :action => "new").should == "/attachments/new"
    end
  
    it "maps #show" do
      route_for(:controller => "attachments", :action => "show", :id => "1").should == "/attachments/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "attachments", :action => "edit", :id => "1").should == "/attachments/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "attachments", :action => "create").should == {:path => "/attachments", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "attachments", :action => "update", :id => "1").should == {:path =>"/attachments/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "attachments", :action => "destroy", :id => "1").should == {:path =>"/attachments/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/attachments").should == {:controller => "attachments", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/attachments/new").should == {:controller => "attachments", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/attachments").should == {:controller => "attachments", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/attachments/1").should == {:controller => "attachments", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/attachments/1/edit").should == {:controller => "attachments", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/attachments/1").should == {:controller => "attachments", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/attachments/1").should == {:controller => "attachments", :action => "destroy", :id => "1"}
    end
  end
end
