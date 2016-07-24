class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :destroy, :edit, :update]

  def index
    @groups = Group.where(customer_id: session[:customer_id]).order(:name)
  end

  def show

  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.customer_id = session[:customer_id]
    if @group.save
      redirect_to :groups
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @group.update_attributes(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end

  def destroy
    deleted_group = @group.name
    if Reservation.where(group_id: @group.id).exists?
      redirect_to groups_path, notice: "#{deleted_group} cannot be deleted as it is in use."
    else
      if @group.destroy
        redirect_to groups_path, notice: "#{deleted_group} was successfully deleted."
      end
    end
  end

  private
  def set_group
    @group = Group.find(params[:id])
    if @group.customer_id != session[:customer_id]
      @group = nil
      redirect_to login_path
    end
  end

  def group_params
    params.require(:group).permit(:name, :customer_id)
  end
end
