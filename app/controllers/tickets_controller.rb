class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @ticket_types = @event.ticket_types
    @ticket = Ticket.new
  end

  def create
    @event = Event.find(params[:event_id])
    @ticket_types = @event.ticket_types
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      TicketMailer.ticket_email(@event, @ticket_types, @ticket).deliver_now
      flash[:success] = "Successfully register ticket"
      redirect_to root_path
    else
      flash.now[:error] = @ticket.errors.full_messages
      render 'new'
    end
  end
  private
    def ticket_params
      params.require(:ticket).permit(:name, :email, :address,:phone, :count, :ticket_type_id)
    end
end
