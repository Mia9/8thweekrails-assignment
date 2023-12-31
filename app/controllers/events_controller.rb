class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]
	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def create
		# @event = Event.create(event_params)
		@event = current_user.events.create(event_params)
		if @event.save
			redirect_to root_path
		else
			render :new
		end
	end

	def show
	end
	
	def edit #find the specified event page 1st
	end

	def update #after edit method, then update the event page
		@event.update(event_params)
		if @event.save
			redirect_to event_path(@event)
		else
			render :edit
		end
	end

	def destroy		
		@event.destroy
		redirect_to root_path
	end

	private
		def set_event
			@event = Event.find(params[:id])
		end

	def event_params
		params.require(:event).permit(:title, :venue, :description, :max_capacity, photos: [])
	end
end