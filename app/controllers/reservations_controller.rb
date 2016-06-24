class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy, :edit, :email, :update, :reset_email]

  def new
    @reservation = Reservation.new
    6.times do
      @reservation.persons.build
    end
  end

  def edit
    size = 6 - @reservation.party_size.to_i
    size.times do
      @reservation.persons.build
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = session[:customer_id]
    @reservation.persons.each do |person|
      person.customer_id = session[:customer_id]
    end
    @reservation.public_id = SecureRandom.urlsafe_base64
    @reservation.is_confirmed = false
    @reservation.email_sent = false
    set_reservation_name(@reservation)
    if @reservation.save
      redirect_to reservations_path
    else
      render :new
    end
  end

  def index
    @reservations = Reservation.where(customer_id: session[:customer_id]).order(:name)
  end

  def show
  end

  def update
    if @reservation.update_attributes(reservation_params)
      redirect_to reservation_path(@reservation)
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

  def email
    customer = Customer.find(session[:customer_id])
    email = customer.current_invitation
    Mailer.reservation_email(@reservation, email, customer).deliver_now
    @reservation.update_columns(email_sent: true)
    redirect_to reservations_path
  end

  def reset_email
    @reservation.update_columns(email_sent: true)
    redirect_to reservations_path
  end

  private
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
      params.require(:reservation).permit(:id, :name, :email, :customer_id, :party_size, :address, :city, :state, :zip, :group_id, persons_attributes: [:id, :first_name, :last_name, :meal_id])
  end

  def set_reservation_name(reservation)
    if reservation.name.nil? || reservation.name.blank?
      if reservation.persons.first.nil?
        reservation.name = 'Unnamed Group'
      else
        if reservation.party_size.to_i > 1
          reservation.name = "#{reservation.persons.first.first_name} #{reservation.persons.first.last_name} and company"
        else
          reservation.name = "#{reservation.persons.first.first_name} #{reservation.persons.first.last_name}"
        end
      end
    end
  end

end
