class PublicPagesController < ApplicationController
  def index
    url = request.base_url
    if url.count('.') == 2
      url = url[11..-1]
      @customer = Customer.where(url: url ).first
    else
      url = url[7..-1]
      @customer = Customer.where(url: url ).first
    end

    if @customer
      session[:customer_id] = @customer.id
      session[:customer_name]  = @customer.name
      session[:current_confirmation] = @customer.current_confirmation
      if params[:public_id]
        @reservation = Reservation.where(public_id: params[:public_id]).first
        @reservation.party_size = @reservation.party_size.to_i
      else
        @reservation = Reservation.new
        if params[:love]
          multiplier = 73886119512
          #1 reservation: 73886119512
          #..
          #6 reservations: 443316717072
          if (params[:love].to_i % multiplier) == 0
            @reservation.party_size = params[:love].to_i / multiplier
          end
        else
          @reservation.party_size = 1
        end
      end
      party_size = @reservation.party_size
      size = party_size - @reservation.associated_people.to_i
      size.times do
        @reservation.persons.build
      end
    else
      redirect_to dashboard_path
    end

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
    @reservation.customer_id = session[:customer_id]
    @reservation.is_confirmed = true
    @reservation.email_sent = true
    @reservation.public_id = SecureRandom.urlsafe_base64
    set_reservation_name(@reservation)
    respond_to do |format|
      if @reservation.save
        format.html{ redirect_to :back }
        format.js{ }
        format.json{ render json: @reservation, status: :created, location: @reservation}
        if session[:current_confirmation]
          Mailer.reservation_email(@reservation, session[:current_confirmation]).deliver_now
        end
      else
        format.html { render action: 'index' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @reservation = Reservation.where(public_id: params[:public_id]).first
    @reservation.is_confirmed = true
    respond_to do |format|
      if @reservation.update_attributes(reservation_params)
        format.html{ redirect_to :back }
        format.js{ }
        format.json{ render json: @reservation, status: :created, location: @reservation}
        if session[:current_confirmation]
          Mailer.reservation_email(@reservation, 1).deliver_now
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
    params.require(:reservation).permit(:id, :name, :customer_id, :party_size, :address, :city, :state, :zip, :email, persons_attributes: [:id, :first_name, :last_name, :meal_id])
  end

  def set_reservation_name(reservation)
    if reservation.party_size.to_i > 1
      reservation.name = "#{reservation.persons.first.first_name} #{reservation.persons.first.last_name} and company"
    else
      reservation.name = "#{reservation.persons.first.first_name} #{reservation.persons.first.last_name}"
    end
  end

end