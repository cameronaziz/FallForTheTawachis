class CustomersController < ApplicationController
    before_action :set_customer, only: [:show, :destroy, :edit, :update]


    def show
    end

    def new
      @reservation = Reservation.new
    end

    def create
      @reservation = Reservation.new(reservation_params)
      #todo: change to dynamic customer id
      @reservation.customer_id = session[:customer_id]
      if @reservation.save
        redirect_to :back
      else
        render 'reservations/new'
      end
    end


    def edit

    end

    def update
      if @customer.update_attributes(customer_params)
        redirect_to root_path
      else
        render :edit
      end
    end

    def destroy
      print 'execute destroy'
      deleted_reservation = @reservation.full_name
      if @reservation.destroy
        redirect_to reservations_path, notice: "#{deleted_reservation} was successfully deleted."
      end
    end

    private
    def set_customer
      @customer = Customer.find(session[:customer_id])
    end

    def customer_params
        params.require(:customer).permit(:name)
    end

end
