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

  def generate
    customer = Customer.new
    customer.id = '1'
    customer.name = 'Test'
    customer.save
    redirect_to static_pages_index_path
  end
end
