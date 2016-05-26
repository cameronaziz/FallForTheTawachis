class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy, :edit, :update]
  skip_before_filter  :verify_authenticity_token

  def new
    @reservation = Reservation.new
    @reservation.build_invitee
    @reservation.build_companion
  end

  def confirm
    session[:temporary_id] = params[:id]
    redirect_to '/'
  end


  def edit
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = session[:customer_id]
    @reservation.invitee.customer_id = session[:customer_id]
    if @reservation.party_size == 2
      @reservation.invitee.customer_id = session[:customer_id]
    end

    set_reservation_name(@reservation)
    respond_to do |format|
        if @reservation.save
          format.html{ redirect_to :back }
          format.js{ }
          format.json{ render json: @reservation, status: :created, location: @reservation}
        else
          format.html { render action: 'new' }
          format.json { render json: @reservation.errors, status: :unprocessable_entity }
        end
    end
  end


  def index
    @reservations = Reservation.where(customer_id: session[:customer_id])
  end

  def show
  end

  def update
    if @reservation.update_attributes(reservation_params)
      redirect_to reservations_path
    else
      render :edit
    end
  end

  def destroy
    deleted_reservation = @reservation.name
    if @reservation.destroy
      redirect_to reservations_path, notice: "#{deleted_reservation} was successfully deleted."
    end
  end

  private
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
      params.require(:reservation).permit(:name, :customer_id, :party_size, :address, :city, :state, :zip, invitee_attributes: [:id, :first_name, :last_name, :meal_id], companion_attributes: [:id, :first_name, :last_name, :meal_id])
  end

  def set_reservation_name(reservation)
    if reservation.party_size == 2
      if reservation.invitee.last_name == reservation.companion.last_name
        reservation.name = "#{reservation.invitee.first_name} & #{reservation.companion.first_name} #{reservation.invitee.last_name}"
      else
        reservation.name = "#{reservation.invitee.first_name} #{reservation.invitee.last_name} & #{reservation.companion.first_name} #{reservation.companion.last_name}"
      end
    else
      reservation.name = "#{reservation.invitee.first_name} #{reservation.invitee.last_name}"
    end
  end

end
