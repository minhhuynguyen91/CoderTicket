class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @ticket_types = @event.ticket_types
    @ticket = Ticket.new
  end

  private
    def ticket_params

    end
end
