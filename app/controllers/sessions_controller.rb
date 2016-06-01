class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to '/reservations'
    else
      # Create an error message.
      render 'new', notice: 'Invalid login attempt.'
    end
  end

end
