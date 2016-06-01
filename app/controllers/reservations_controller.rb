class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy, :edit, :update]

  def new
    @reservation = Reservation.new
    6.times do
      @reservation.persons.build
    end
  end

  def edit
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = session[:customer_id]
    @reservation.temporary_id = rand(999999999)
    @reservation.is_confirmed = true
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
      params.require(:reservation).permit(:name, :customer_id, :party_size, :address, :city, :state, :zip, persons_attributes: [:id, :first_name, :last_name, :meal_id])
  end

  def set_reservation_name(reservation)
    if reservation.party_size.to_i > 1
      reservation.name = "#{reservation.persons.first.first_name} #{reservation.persons.first.last_name} and company"
    else
      reservation.name = "#{reservation.persons.first.first_name} #{reservation.persons.first.last_name}"
    end
  end

end
