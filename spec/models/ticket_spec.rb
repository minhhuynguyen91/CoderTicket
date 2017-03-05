require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe '.not_more_than_quantity' do
    it 'return false when ticket number exceed the max_quantity' do
      ticket_type = TicketType.new(:max_quantity => 10)
      ticket_type.save(:validates => false)

      ticket = Ticket.new(:ticket_type_id => ticket_type.id, :count => 11)
      
      expect(ticket.valid?).to eq(false)
    end
    it 'return true when ticket number is less than the max_quantity' do
      ticket_type = TicketType.new(:max_quantity => 10)
      ticket_type.save(:validates => false)
      
      ticket = Ticket.new(:ticket_type_id => ticket_type.id, :count => 8)
      expect(ticket.valid?).to eq(true)
    end

    it "update the ticket_type max_quantity after successfully booking ticket" do
      ticket_type = TicketType.new(:max_quantity => 10)
      ticket_type.save(:validates => false)
      
      ticket = Ticket.create!(:ticket_type_id => ticket_type.id, :count => 8)
      
      expect(ticket_type.max_quantity).to eq(2)
    end
  end
  describe '.not_from_the_past' do
    it "return validation false if the ticket is created for event from the past" do
      event = Event.new(:starts_at => 1.day.ago)
      event.save(:validate => false)

      ticket_types = event.ticket_types.build
      ticket_types.save(:validates => false)
      
      ticket = ticket_types.tickets.new
      expect(ticket.valid?).to eq(false)
    end
  end
end
