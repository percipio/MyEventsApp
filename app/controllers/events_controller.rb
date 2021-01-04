class EventsController < ApplicationController
  def index 
    @events = Event.all.order(start_datetime: :desc)
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  private

    def event_params
      params.require(:event).permit(:title, :start_datetime, :location)
    end
end