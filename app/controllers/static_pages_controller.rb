class StaticPagesController < ApplicationController
  def index
    session[:customer_id] = '1'
    @customer = Customer.find(session[:customer_id])
    session[:customer_name]  = @customer.name
    @reservation = Reservation.new
    @reservation.build_invitee
    @reservation.build_companion
  end

  def login
    session[:customer_id] = '1'
    @customer = Customer.find(session[:customer_id])
    session[:customer_name]  = @customer.name
  end
end
