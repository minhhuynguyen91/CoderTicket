class Ticket < ApplicationRecord
  belongs_to :ticket_type
  validate :not_more_than_quantity
  
  def not_more_than_quantity
    count < TicketType.find_by_id(ticket_type_id).max_quantity
  end
end
