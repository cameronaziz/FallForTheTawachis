class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy, :edit, :update]

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
      #todo: add food type ability
      invitee = Invitee.new(params.require(:reservation).permit(:name))
      invitee.reservation_id = @reservation.id
      invitee.customer_id = session[:customer_id]
      invitee.save
      if @reservation.party_size == 2
        companion = Companion.new()
        companion.reservation_id = @reservation.id
        companion.customer_id = session[:customer_id]
        companion.invitee_id=invitee.id
        companion.save
      end
      redirect_to :back
    else
      render 'reservations/new'
    end
  end


  def index
    @reservations = Reservation.where(customer_id: session[:customer_id])
  end

  def show
  end

  def update
  end

  def destroy
    print 'execute destroy'
    deleted_reservation = @reservation.full_name
    if @reservation.destroy
      redirect_to reservations_path, notice: "#{deleted_reservation} was successfully deleted."
    end
  end

  private
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    if params[:reservation]
      params.require(:reservation).permit(:name, :customer_id, :party_size)
    else
      params.permit(:name, :customer_id, :party_size)
    end
  end
end
