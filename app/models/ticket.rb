class Ticket < ApplicationRecord
  belongs_to :ticket_type
  validate :not_more_than_quantity
  validate :not_from_the_past

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

  def not_from_the_past
    ticket_type = TicketType.find_by_id(self.ticket_type_id)
    event = Event.find_by_id(ticket_type.event_id)
    
    if event.starts_at < Time.now
      errors.add(:date_time,": The event is already started, you can't buy it now")
    end
  end

end
