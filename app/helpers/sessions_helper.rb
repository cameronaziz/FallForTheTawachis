module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    session[:customer_id] = user.customer_id
    session[:customer_name]  = user.customer.name
  end

  def log_out
    session[:customer_id] = nil
    session[:customer_name] = nil
    session[:user_id] = nil
  end

  def current_user
    @current_user = @current_user || User.where(id: session[:user_id]).first
  end

end
