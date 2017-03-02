class EventsController < ApplicationController
  before_action :require_login, :only => [:new, :create, :event_list]
  
  def index
    if params[:search].nil? || params[:search].blank?
      @events = Event.upcoming
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
    @categories = Category.all
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Your event is created"
      redirect_to root_path
    else
      flash[:error] = @event.errors.full_messages
      render 'new'
    end
  end

  def publish
    @event = Event.find(params[:event_id])
    if @event.check_publish?
      @event.publish_event
      redirect_to root_path
    else
      flash[:error]= "Need at least one ticket type to publish event"
      redirect_to mines_events_path
    end
  end

  def event_list
    @events = current_user.events.where(publish:false)
  end

  private
    def event_params
      params.require(:event).permit!
    end

end
