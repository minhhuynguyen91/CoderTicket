class EventsController < ApplicationController
  def index
    if params[:search].nil? || params[:search].blank?
      @events = Event.all
    else
      @events = Event.search(params[:search])
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @categories = Category.all
    @event = Event.new
    @event.build_venue
  end

  def create
    
  end

  private
    def event_params
      params.require(:event).permit!
    end

end
