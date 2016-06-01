class StaticPagesController < ApplicationController
  def index
    session[:customer_id] = '1'
    @customer = Customer.find(session[:customer_id])
    session[:customer_name]  = @customer.name
    if params[:confirm]
      @reservation = Reservation.where(temporary_id: params[:confirm]).first
      @reservation.party_size = @reservation.party_size.to_i
    else
      @reservation = Reservation.new
      if params[:love]
        @reservation.party_size = params[:love].to_i / 147
      else
        @reservation.party_size = 1
      end
    end
    @reservation.party_size.times do
      @reservation.persons.build
    end
  end

  def generate
    customer = Customer.new
    customer.id = '1'
    customer.name = 'Test'
    customer.save
    redirect_to :root
  end
end
