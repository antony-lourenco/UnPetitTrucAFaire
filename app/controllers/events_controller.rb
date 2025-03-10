class EventsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[index] # on laisse les gens voir un ptit peu quoi
  before_action :set_event, only: %i[show edit update destroy]
  include Pagination
  helper_method :page_no, :per_page, :paginate_offset

  def index
    @events = Event.all
    @events = @events.limit(per_page).offset(paginate_offset)
    @total_pages = (Event.count.to_f / per_page).ceil
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

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :location, :user_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
