class StaticPagesController < ApplicationController
  def index
    session[:customer_id] = '1'
    @customer = Customer.find(session[:customer_id])
    session[:customer_name]  = @customer.name
    # migrated from reservations#new
    if params[:love]
      size = params[:love].to_i / 147
    else
      size = 1
    end
    @reservation = Reservation.new
    size.times do
      @reservation.persons.build
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
