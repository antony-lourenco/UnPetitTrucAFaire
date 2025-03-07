class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update delete]

  def index
    @events = Event.all
  end

  def show; end

  def new
    @event = Event.new
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
    @event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :location)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
