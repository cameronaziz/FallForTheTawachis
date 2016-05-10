class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :destroy, :edit, :update]

  def index
    @meals = Meal.where(customer_id: session[:customer_id]).order(:name)
  end

  def show

  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.customer_id = session[:customer_id]
    if @meal.save
      redirect_to :meals
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @meal.update_attributes(meal_params)
      redirect_to meals_path
    else
      render :edit
    end
  end

  def destroy
    deleted_meal = @meal.name
    if @meal.destroy
      redirect_to meals_path, notice: "#{deleted_meal} was successfully deleted."
    end
  end

  private
  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
      params.require(:meal).permit(:name, :customer_id, :is_vegetarian)
  end
end
