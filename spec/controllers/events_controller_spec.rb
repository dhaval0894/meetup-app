require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'create new event' do
        post :create, event: attributes_for(:event)
        expect(Event.count).to eq(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new event' do
        expect do
          post :create, event: attributes_for(:invalid_event)
        end.to_not change(Event, :count)
      end
    end
  end

  describe 'GET #index' do
    it 'populates an array of events' do
      event1 = create(:event)
      event2 = create(:event)
      get :index
      expect(assigns(:events)).to eq([event1, event2])
    end

    it 'render the #index view' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'assigns @event' do
      event = create(:event)
      get :show, id: event
      expect(assigns(:event)).to eq(event)
    end

    it 'render the #show view' do
      get :show, id: create(:event)
      expect(response).to render_template('show')
    end
  end

  describe 'PUT #update' do
    before :each do
      @event = create(:event)
    end

    context 'valid attributes' do
      it 'located the requested @event' do
        put :update, id: @event, event: attributes_for(:event)
        expect(assigns(:event)).to eq(@event)
      end

      it 'changes @event attributes' do
        put :update, id: @event, event: attributes_for(:event,
                                                       name: 'Rails workshop')
        @event.reload
        expect(@event.name).to eq('Rails workshop')
      end

      it 'redirects to events#index' do
        put :update, id: @event, event: attributes_for(:event)
        expect(response).to redirect_to(events_path)
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @event = create(:event)
    end

    it 'deletes the contact' do
      expect do
        delete :destroy, id: @event
      end.to change(Event, :count).by(-1)
    end

    it 'redirects to events#index' do
      delete :destroy, id: @event
      expect(response).to redirect_to events_url
    end
  end
end
