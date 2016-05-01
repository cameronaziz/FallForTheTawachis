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
    @reservation.customer_id = 1
    if @reservation.save
      redirect_to reservations_path
    else
      render 'reservations/new'
    end
  end



  def index
    @reservations = Reservation.all
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def reservation_params
    if params[:reservation]
      params.require(:reservation).permit(:name, :customer_id)
    else
      params.permit(:name, :customer_id)
    end
  end
end
