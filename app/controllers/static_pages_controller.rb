class StaticPagesController < ApplicationController
  def home
    session[:customer_id] = '1'
    @reservation = Reservation.new
  end
end
