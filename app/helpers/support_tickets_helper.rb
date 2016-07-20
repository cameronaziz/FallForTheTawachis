module SupportTicketsHelper
  def ticket_status(ticket)
    if ticket.is_closed
      'Closed'
    else
      'Active'
    end
  end

  def close_link(ticket)
    unless ticket.is_closed
      link_to 'Close', controller: :support_tickets, action: :close, id: ticket, data: {confirm: 'Are you sure?'}
    end
  end

  def close_button(ticket)
    unless ticket.is_closed
      link_to 'Close', close_ticket_path, id: ticket, class: 'btn btn-warning'
    end
  end
end
