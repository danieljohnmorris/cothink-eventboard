require 'spec_helper'

describe Admin::EventsController do

  def mock_event(stubs={})
    @mock_event ||= mock_model(Admin::Event, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all admin_events as @admin_events" do
      Admin::Event.stub(:all) { [mock_event] }
      get :index
      assigns(:admin_events).should eq([mock_event])
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      Admin::Event.stub(:find).with("37") { mock_event }
      get :show, :id => "37"
      assigns(:event).should be(mock_event)
    end
  end

  describe "GET new" do
    it "assigns a new event as @event" do
      Admin::Event.stub(:new) { mock_event }
      get :new
      assigns(:event).should be(mock_event)
    end
  end

  describe "GET edit" do
    it "assigns the requested event as @event" do
      Admin::Event.stub(:find).with("37") { mock_event }
      get :edit, :id => "37"
      assigns(:event).should be(mock_event)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created event as @event" do
        Admin::Event.stub(:new).with({'these' => 'params'}) { mock_event(:save => true) }
        post :create, :event => {'these' => 'params'}
        assigns(:event).should be(mock_event)
      end

      it "redirects to the created event" do
        Admin::Event.stub(:new) { mock_event(:save => true) }
        post :create, :event => {}
        response.should redirect_to(admin_event_url(mock_event))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved event as @event" do
        Admin::Event.stub(:new).with({'these' => 'params'}) { mock_event(:save => false) }
        post :create, :event => {'these' => 'params'}
        assigns(:event).should be(mock_event)
      end

      it "re-renders the 'new' template" do
        Admin::Event.stub(:new) { mock_event(:save => false) }
        post :create, :event => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested event" do
        Admin::Event.should_receive(:find).with("37") { mock_event }
        mock_event.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :event => {'these' => 'params'}
      end

      it "assigns the requested event as @event" do
        Admin::Event.stub(:find) { mock_event(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:event).should be(mock_event)
      end

      it "redirects to the event" do
        Admin::Event.stub(:find) { mock_event(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(admin_event_url(mock_event))
      end
    end

    describe "with invalid params" do
      it "assigns the event as @event" do
        Admin::Event.stub(:find) { mock_event(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:event).should be(mock_event)
      end

      it "re-renders the 'edit' template" do
        Admin::Event.stub(:find) { mock_event(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested event" do
      Admin::Event.should_receive(:find).with("37") { mock_event }
      mock_event.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the admin_events list" do
      Admin::Event.stub(:find) { mock_event(:destroy => true) }
      delete :destroy, :id => "1"
      response.should redirect_to(admin_events_url)
    end
  end

end
