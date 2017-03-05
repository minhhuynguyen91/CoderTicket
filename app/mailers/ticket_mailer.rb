class TicketMailer < ApplicationMailer
  default from: "develop_rails_4fun@zoho.com"

  def ticket_email(event, ticket_types, ticket)
    @event = event
    @ticket_types = ticket_types
    @ticket = ticket

    subject_email = "Your ticket #{@ticket_types.name} for event #{@event.name} is booked" 

    mail(to: @ticket.email, :subject => subject_email)
  end

end
