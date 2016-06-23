class AddNotAttendingToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :not_attending, :boolean
  end
end
