require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ShipsController do

  def mock_ship(stubs={ :name => "Death Star" })
    @mock_ship ||= mock_model(Ship, stubs)
  end
  
  describe "GET index" do

    it "exposes all ships as @ships" do
      Ship.should_receive(:find).with(:all).and_return([mock_ship])
      get :index
      assigns[:ships].should == [mock_ship]
    end

  end

  describe "GET show" do

    it "exposes the requested ship as @ship" do
      Ship.should_receive(:find).with("37").and_return(mock_ship)
      get :show, :id => "37"
      assigns[:ship].should equal(mock_ship)
    end
        
  end

  describe "GET new" do
  
    it "exposes a new ship as @ship" do
      Ship.should_receive(:new).and_return(mock_ship)
      get :new
      assigns[:ship].should equal(mock_ship)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested ship as @ship" do
      Ship.should_receive(:find).with("37").and_return(mock_ship)
      get :edit, :id => "37"
      assigns[:ship].should equal(mock_ship)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created ship as @ship" do
        Ship.should_receive(:new).with({'these' => 'params'}).and_return(mock_ship(:save => true))
        post :create, :ship => {:these => 'params'}
        assigns(:ship).should equal(mock_ship)
      end

      it "redirects to the created ship" do
        Ship.stub!(:new).and_return(mock_ship(:save => true))
        post :create, :ship => {}
        response.should redirect_to(ship_url(mock_ship))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved ship as @ship" do
        Ship.stub!(:new).with({'these' => 'params'}).and_return(mock_ship(:save => false))
        post :create, :ship => {:these => 'params'}
        assigns(:ship).should equal(mock_ship)
      end

      it "re-renders the 'new' template" do
        Ship.stub!(:new).and_return(mock_ship(:save => false))
        post :create, :ship => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested ship" do
        Ship.should_receive(:find).with("37").and_return(mock_ship)
        mock_ship.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :ship => {:these => 'params'}
      end

      it "exposes the requested ship as @ship" do
        Ship.stub!(:find).and_return(mock_ship(:update_attributes => true))
        put :update, :id => "1"
        assigns(:ship).should equal(mock_ship)
      end

      it "redirects to the ship" do
        Ship.stub!(:find).and_return(mock_ship(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(ship_url(mock_ship))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested ship" do
        Ship.should_receive(:find).with("37").and_return(mock_ship)
        mock_ship.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :ship => {:these => 'params'}
      end

      it "exposes the ship as @ship" do
        Ship.stub!(:find).and_return(mock_ship(:update_attributes => false))
        put :update, :id => "1"
        assigns(:ship).should equal(mock_ship)
      end

      it "re-renders the 'edit' template" do
        Ship.stub!(:find).and_return(mock_ship(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested ship" do
      Ship.should_receive(:find).with("37").and_return(mock_ship)
      mock_ship.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the ships list" do
      Ship.stub!(:find).and_return(mock_ship(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(ships_url)
    end

  end

end
