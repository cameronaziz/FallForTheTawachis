class PublicPagesController < ApplicationController
  def index
    @customer = get_customer_from_url
    if @customer
      if session[:public_id]
        @reservation = Reservation.where(public_id: session[:public_id]).first
      end
      unless @reservation
        generate_reservation(@customer.default_reservation_size)
      end
      party_size = @reservation.party_size.to_i
      size = party_size - @reservation.associated_people.to_i
      size.times do
        @reservation.persons.build
      end
    else
      redirect_to dashboard_path
    end
  end

  def public_id
    session[:public_id] = params[:public_id]
    redirect_to root_path
  end

  def dashboard
    if session[:user_id]
      redirect_to reservations_path
    else
      redirect_to login_path
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    #todo remove @customer
    @customer = get_customer_from_url

    @reservation.customer_id = @customer.id
    @reservation.persons.each do |person|
      person.customer_id = @customer.id
    end
    @reservation.is_confirmed = true
    @reservation.email_sent = true
    @reservation.public_id = SecureRandom.urlsafe_base64

    set_reservation_name(@reservation)

    respond_to do |format|
      if @reservation.save
        format.html{ redirect_to :back }
        format.js{ }
        format.json{ render json: @reservation, status: :created, location: @reservation}
        if @reservation.customer.current_confirmation
          Mailer.reservation_email(@reservation, @reservation.customer.current_confirmation).deliver_now
        end
      else
        format.html { render action: 'index' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @reservation = Reservation.find_by_public_id(session[:public_id])
    @reservation.is_confirmed = true

    respond_to do |format|
      if @reservation.update_attributes(reservation_params)
        format.html{ redirect_to :back }
        format.js{ }
        format.json{ render json: @reservation, status: :created, location: @reservation}
        unless @reservation.not_attending
          if @reservation.customer.current_confirmation
            Mailer.reservation_email(@reservation, @reservation.customer.current_confirmation).deliver_now
          end
        end
      else
        format.html { render action: 'index' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:id, :not_attending, :name, :customer_id, :party_size, :address, :city, :state, :zip, :email, persons_attributes: [:id, :first_name, :last_name, :meal_id, :_destroy])
  end

  def set_reservation_name(reservation)
    if reservation.party_size.to_i > 1
      reservation.name = "#{reservation.persons.first.first_name} #{reservation.persons.first.last_name} and company"
    else
      reservation.name = "#{reservation.persons.first.first_name} #{reservation.persons.first.last_name}"
    end
  end

  def get_customer_from_url
    url = request.base_url
    if url.count('.') == 2
      url = url[11..-1]
      customer = Customer.where(url: url ).first
    else
      url = url[7..-1]
      customer = Customer.where(url: url ).first
    end
    customer
  end

  def generate_reservation(party_size)
    @reservation = Reservation.new
    @reservation.party_size = party_size
  end

end