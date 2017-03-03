class Ticket < ApplicationRecord
  belongs_to :ticket_type
  validate :not_more_than_quantity
  
  def not_more_than_quantity
    ticket_type = TicketType.find_by_id(self.ticket_type_id)
    max_value = ticket_type.max_quantity
    if count > max_value
      errors.add(:count, ": can't exceed #{max_value}")
    else
      ticket_type.max_quantity = max_value - count
      ticket_type.save
    end
  end
end
