class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def front_new
    @reservation = Reservation.new
  end

  def edit
  end

  def create
    @reservation = Reservation.new(reservation_params)
    #todo: change to dynamic customer id
    @reservation.customer_id = session[:customer_id]
    if @reservation.save
      redirect_to :back
    else
      render 'reservations/new'
    end
  end


  def index
    @reservations = Reservation.where(customer_id: session[:customer_id])
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def reservation_params
    if params[:reservation]
      params.require(:reservation).permit(:name, :customer_id, :party_size)
    else
      params.permit(:name, :customer_id, :party_size)
    end
  end
end
