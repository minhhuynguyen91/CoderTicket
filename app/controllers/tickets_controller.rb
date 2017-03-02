class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @ticket_types = @event.ticket_types
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      flash[:success] = "Sussessul register ticket"
      redirect_to root_path
    else
      flash.now[:error] = @ticket.errors.full_messages
      @event = Event.find(params[:event_id])
      @ticket_types = @event.ticket_types
      render 'new'
    end
  end
  private
    def ticket_params
      params.permit(:name,:address,:phone, :count,:ticket_type_id)
    end
end
