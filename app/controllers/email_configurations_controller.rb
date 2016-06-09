class EmailConfigurationsController < ApplicationController
  def index
    @email_configurations = EmailConfiguration.where(email_template_id: params[:id])
  end

  def edit
    @configuration = EmailConfiguration.find(params[:id])
  end


end
