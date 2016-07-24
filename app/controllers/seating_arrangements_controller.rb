class SeatingArrangementsController < ApplicationController
  def app
    @reservations = Reservation.where(customer_id: session[:customer_id]).order(:name)
    total = 0
    confirmed = 0
    unconfirmed = 0
    @reservations.each do |reservation|
      unless reservation.not_attending
        if reservation.is_confirmed
          confirmed = confirmed + reservation.party_size
        else
          unconfirmed = unconfirmed + reservation.party_size
        end
        total = total + reservation.party_size
      end
    end
    amount = ((total.to_f / @reservations.first.customer.table_size.to_f).ceil)
    size = @reservations.first.customer.table_size
    @tables = { amount: amount, size: size }
  end

end
