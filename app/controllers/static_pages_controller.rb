class StaticPagesController < ApplicationController
  def index

  end

  def variable_view
    url = request.base_url
    if url.count('.') == 2
      @url = url[10..-1]
    else
      @url = url[7..-1]
    end
  end

  def generate
    customer = Customer.new
    customer.id = '1'
    customer.name = 'Test'
    customer.save
    redirect_to :root
  end

  private
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:id, :name, :customer_id, :party_size, :address, :city, :state, :zip, persons_attributes: [:id, :first_name, :last_name, :meal_id])
  end

  def set_reservation_name(reservation)
    if reservation.party_size.to_i > 1
      reservation.name = "#{reservation.persons.first.first_name} #{reservation.persons.first.last_name} and company"
    else
      reservation.name = "#{reservation.persons.first.first_name} #{reservation.persons.first.last_name}"
    end
  end

end
