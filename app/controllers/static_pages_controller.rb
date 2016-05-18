class StaticPagesController < ApplicationController
  def index
    session[:customer_id] = '1'
    @customer = Customer.find(session[:customer_id])
    session[:customer_name]  = @customer.name
    if session[:temporary_id]
      reservation = Reservation.where(temporary_id: session[:temporary_id])
      @reservation = reservation.first
    else
      @reservation = Reservation.new
    end
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
