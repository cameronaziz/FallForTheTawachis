class StaticPagesController < ApplicationController
  def home
    @reservation = Reservation.new
  end
end
