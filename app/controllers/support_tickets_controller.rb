class SupportTicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :destroy, :edit, :update]

  def index
    @tickets = SupportTicket.where(customer_id: session[:customer_id])
  end

  def new
    @ticket = SupportTicket.new
  end

  def create
    @support_ticket = SupportTicket.new(support_ticket_params)
    @support_ticket.customer_id = session[:customer_id]
    @support_ticket.created_by = session[:user_id]
    @support_ticket.is_closed = 0
    if @support_ticket.save
      redirect_to support_tickets_path
    else
      render 'new'
    end
  end


  def show
    @support_comment = SupportComment.new
  end


  private
  def support_ticket_params
    params.require(:support_ticket).permit(:title, :description)
  end

  def set_ticket
    @support_ticket = SupportTicket.find(params[:id])
  end
end
