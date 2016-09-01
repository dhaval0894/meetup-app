class EventsController < ApplicationController

	def index
		@events = Event.all
	end	

	def new
    @event = Event.new
	end	

	def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path }
      else
        format.html { render action: 'new' }
      end  
    end  
	end	

	def edit
	end	

	def update
  end  

	def delete
	end	

	private

    # Never trust parameters from the scary internet, only allow the white list through.
  	def event_params
  		params.require(:event).permit(:name, :description, :technology, :agenda, :pre_requisite, :venue, :event_date)
  	end	

end
