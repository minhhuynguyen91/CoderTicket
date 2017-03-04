class EventsController < ApplicationController
  before_action :require_login, :only => [:new, :create, :event_list, :edit]
  before_action :check_user_permission, :only => [:edit, :update]
  
  def index
    if params[:search].nil? || params[:search].blank?
      @events = Event.upcoming
    else
      @events = Event.search(params[:search])
    end
  end

  def show
    @event = Event.find(params[:id])
    @related_events = Event.check_related_event(params[:id])
  end

  def new
    @categories = Category.all
    @regions = Region.all
    @event = Event.new
    @event.build_venue
  end

  def create
    @regions = Region.all
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

  def edit
    @event = Event.find(params[:id])
    @categories = Category.all
    @regions = Region.all
  end

  def update
    @event = Event.find(params[:id])
    @categories = Category.all
    @event.attributes = event_params

    if @event.save
      flash[:success] = "Event is successfully updated"
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
    #@events = current_user.events.where(publish:false)
    @events = current_user.events.order(:publish)
    @users = User.where.not(:id => current_user.id)
  end

  private
    def event_params
      params.require(:event).permit!
    end

end
