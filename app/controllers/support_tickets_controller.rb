class SupportTicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :update, :close]

  def index
    @support_tickets = SupportTicket.where(customer_id: session[:customer_id])
  end

  def new
    @support_ticket = SupportTicket.new
  end

  def create
    @support_ticket = SupportTicket.new(support_ticket_params)
    @support_ticket.customer_id = session[:customer_id]
    @support_ticket.created_by = session[:user_id]
    @support_ticket.is_closed = 0
    if @support_ticket.save
      redirect_to support_ticket_path(@support_ticket)
    else
      render 'new'
    end
  end

  def close
    @support_ticket.update_columns(is_closed: true)
    redirect_to support_tickets_path
  end

  def show
    @support_comment = SupportComment.new
  end

  def update
    if @support_ticket.update_attributes(support_ticket_params)
      redirect_to :back
    else
      render :show
    end
  end

  private
  def support_ticket_params
    params.require(:support_ticket).permit(:id, :title, :description, support_comments_attributes: [:id, :comment])
  end

  def set_ticket
    @support_ticket = SupportTicket.find(params[:id])
  end
end
