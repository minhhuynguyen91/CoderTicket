class TicketTypesController < ApplicationController
  def new
    @ticket_type = Event.find_by_id(params[:event_id]).ticket_types.build
  end

  def create
    @ticket_type = TicketType.new(ticket_type_params)
    if @ticket_type.save
      redirect_to mines_events_path
    else
      render new_ticket_type_path
    end
  end

  private
    def ticket_type_params
      params.require(:ticket_type).permit!
    end

end
