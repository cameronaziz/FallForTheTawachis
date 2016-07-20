class SupportCommentsController < ApplicationController
  def create
    @support_ticket = SupportTicket.find(params[:support_ticket_id])
    @support_comment = @support_ticket.support_comments.build(support_comment_params)
    @support_comment.user_id = session[:user_id]
    if @support_comment.save
      redirect_to @support_ticket
    else
      render :new
    end
  end


  private
  def support_comment_params
    params.require(:support_comment).permit(:comment)
  end
end
