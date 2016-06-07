module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    session[:customer_id] = user.customer_id
    session[:customer_name]  = user.customer.name
  end

  def authenticate(user)
  end
end
