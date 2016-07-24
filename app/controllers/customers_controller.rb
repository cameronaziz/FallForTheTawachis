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
#      name = params[:customer][:name]
#      if @customer.update_attributes(customer_params)
#        redirect_to edit_customer_path(@customer), notice: "#{name} was successfully updated."
#      else
#        render :edit
#      end


      respond_to do |format|
        if @customer.update_attributes(customer_params)
          format.html{ redirect_to :back }
          format.js{ }
          format.json{ render json: @customer, status: :created, location: @customer}
        else
          format.html { render action: 'edit' }
          format.json { render json: @customer.errors, status: :unprocessable_entity }
        end
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
      params.require(:customer).permit(:name, :from_email, :current_confirmation, :current_invitation, :table_size)
    end

end
