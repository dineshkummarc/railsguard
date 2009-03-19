require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ShipsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "ships", :action => "index").should == "/ships"
    end
  
    it "maps #new" do
      route_for(:controller => "ships", :action => "new").should == "/ships/new"
    end
  
    it "maps #show" do
      route_for(:controller => "ships", :action => "show", :id => "1").should == "/ships/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "ships", :action => "edit", :id => "1").should == "/ships/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "ships", :action => "create").should == {:path => "/ships", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "ships", :action => "update", :id => "1").should == {:path =>"/ships/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "ships", :action => "destroy", :id => "1").should == {:path =>"/ships/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/ships").should == {:controller => "ships", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/ships/new").should == {:controller => "ships", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/ships").should == {:controller => "ships", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/ships/1").should == {:controller => "ships", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/ships/1/edit").should == {:controller => "ships", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/ships/1").should == {:controller => "ships", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/ships/1").should == {:controller => "ships", :action => "destroy", :id => "1"}
    end
  end
end
