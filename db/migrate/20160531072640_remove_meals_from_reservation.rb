class RemoveMealsFromReservation < ActiveRecord::Migration
  def change
    remove_column :reservations, :meal_id
  end
end
