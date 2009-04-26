require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AttachmentsController do

  def mock_attachment(stubs={})
    @mock_attachment ||= mock_model(Attachment, stubs)
  end
  
  describe "GET index" do

    it "exposes all attachments as @attachments" do
      Attachment.should_receive(:find).with(:all).and_return([mock_attachment])
      get :index
      assigns[:attachments].should == [mock_attachment]
    end

    describe "with mime type of xml" do
  
      it "renders all attachments as xml" do
        Attachment.should_receive(:find).with(:all).and_return(attachments = mock("Array of Attachments"))
        attachments.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested attachment as @attachment" do
      Attachment.should_receive(:find).with("37").and_return(mock_attachment)
      get :show, :id => "37"
      assigns[:attachment].should equal(mock_attachment)
    end
    
    describe "with mime type of xml" do

      it "renders the requested attachment as xml" do
        Attachment.should_receive(:find).with("37").and_return(mock_attachment)
        mock_attachment.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new attachment as @attachment" do
      Attachment.should_receive(:new).and_return(mock_attachment)
      get :new
      assigns[:attachment].should equal(mock_attachment)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested attachment as @attachment" do
      Attachment.should_receive(:find).with("37").and_return(mock_attachment)
      get :edit, :id => "37"
      assigns[:attachment].should equal(mock_attachment)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created attachment as @attachment" do
        Attachment.should_receive(:new).with({'these' => 'params'}).and_return(mock_attachment(:save => true))
        post :create, :attachment => {:these => 'params'}
        assigns(:attachment).should equal(mock_attachment)
      end

      it "redirects to the created attachment" do
        Attachment.stub!(:new).and_return(mock_attachment(:save => true))
        post :create, :attachment => {}
        response.should redirect_to(attachment_url(mock_attachment))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved attachment as @attachment" do
        Attachment.stub!(:new).with({'these' => 'params'}).and_return(mock_attachment(:save => false))
        post :create, :attachment => {:these => 'params'}
        assigns(:attachment).should equal(mock_attachment)
      end

      it "re-renders the 'new' template" do
        Attachment.stub!(:new).and_return(mock_attachment(:save => false))
        post :create, :attachment => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested attachment" do
        Attachment.should_receive(:find).with("37").and_return(mock_attachment)
        mock_attachment.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :attachment => {:these => 'params'}
      end

      it "exposes the requested attachment as @attachment" do
        Attachment.stub!(:find).and_return(mock_attachment(:update_attributes => true))
        put :update, :id => "1"
        assigns(:attachment).should equal(mock_attachment)
      end

      it "redirects to the attachment" do
        Attachment.stub!(:find).and_return(mock_attachment(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(attachment_url(mock_attachment))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested attachment" do
        Attachment.should_receive(:find).with("37").and_return(mock_attachment)
        mock_attachment.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :attachment => {:these => 'params'}
      end

      it "exposes the attachment as @attachment" do
        Attachment.stub!(:find).and_return(mock_attachment(:update_attributes => false))
        put :update, :id => "1"
        assigns(:attachment).should equal(mock_attachment)
      end

      it "re-renders the 'edit' template" do
        Attachment.stub!(:find).and_return(mock_attachment(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested attachment" do
      Attachment.should_receive(:find).with("37").and_return(mock_attachment)
      mock_attachment.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the attachments list" do
      Attachment.stub!(:find).and_return(mock_attachment(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(attachments_url)
    end

  end

end
