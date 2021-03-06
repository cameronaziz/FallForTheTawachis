class EmailConfigurationsController < ApplicationController
  before_action :set_email_configuration, only: [:edit, :update]

  def index
    @email_configurations = EmailConfiguration.where(email_template_id: params[:id])
    if params[:id] == 3
      redirect_to 'email_configurations/3'
    end
  end

  def show
    @customer = Customer.find(session[:customer_id])
    @email_configurations = EmailConfiguration.where(email_template_id: params[:id])
  end


  def edit
  end

  def update
    if @configuration.update_attributes(email_configuration_params)
      redirect_to email_configuration_path(@configuration.email_template_id)
    else
      render 'edit'
    end
  end

  private
  def set_email_configuration
    @configuration = EmailConfiguration.find(params[:id])
  end

  def email_configuration_params
    params.require(:email_configuration).permit(:value)
  end

end
