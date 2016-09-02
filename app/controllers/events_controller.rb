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
    @event = Event.find(params[:id])
	end	

	def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(event_params)
        format.html { redirect_to events_path, notice: 'Course was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end  

  def show
    @event = Event.find(params[:id])
  end  

	def delete
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_path }
    end
	end	

  def register
    @event = Event.find(params[:event_id])
    @participant = @event.participants.new
  end  

  def register_participant
    @event = Event.find(params[:event_id])
    @participant = @event.participants.new(participant_params)

    respond_to do |format|
      if @participant.save
        format.html { redirect_to event_path(@event) }
      else
        format.html { render action: 'register' }
      end  
    end
  end  

  def speaker
    @event = Event.find(params[:event_id])
    @speaker = @event.build_speaker
  end  

  def add_speaker
    @event = Event.find(params[:event_id])
    @speaker = @event.build_speaker(speaker_params)

    respond_to do |format|
      if @speaker.save
        format.html { redirect_to event_path(@event) }
      else
        format.html { render action: 'speaker' }
      end  
    end
  end  

	private

    # Never trust parameters from the scary internet, only allow the white list through.
  	def event_params
  		params.require(:event).permit(:name, :description, :technology, :agenda, :pre_requisite, :venue, :event_date)
  	end	

    def participant_params
      params.require(:participant).permit(:name, :email, :contact, :suggestion, :gender, :event_id)
    end

    def speaker_params
      params.require(:speaker).permit(:name, :email, :bio, :event_id)
    end  
end
