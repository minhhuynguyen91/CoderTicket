class Ticket < ApplicationRecord
  belongs_to :ticket_type
  validate :not_more_than_quantity
  
  def not_more_than_quantity
    ticket_type = TicketType.find_by_id(ticket_type_id)
    max_quantity = ticket_type.max_quantity
    if count > max_quantity
      errors.add(:count, ": can't exceed #{max_quantity}")
    else
      ticket_type.max_quantity = max_quantity - count
      ticket_type.save
    end
  end
end