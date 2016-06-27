class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def authenticate_user(user, customer_id)
    user_object = User.find(user)
    if user_object.is_administrator
      true
    else
      if customer_id == user_object.customer_id
        true
      else
        redirect_to :root
      end
    end
  end

end
