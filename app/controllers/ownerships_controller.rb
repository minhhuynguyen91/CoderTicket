class OwnershipsController < ApplicationController
  def create
    @event = Event.find_by_id(params[:event_id])
    @ownership = @event.ownerships.build(:owner_id => params[:owner_id])
    if @ownership.save
      flash[:success] = "Added ownership"
    else
      flash[:error] = "Unable to add ownership"
    end
    redirect_to mines_events_path
  end

  def destroy
    @event = Event.find_by_id(params[:event_id])
    @ownership = @event.ownership.find_by(:owner_id => params[:owner_id])
    @ownership.destroy
    flash[:success] = "Removed ownership"
    redirect_to mines_events_path
  end
end
