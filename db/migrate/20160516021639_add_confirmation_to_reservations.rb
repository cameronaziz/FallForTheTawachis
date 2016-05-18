class AddConfirmationToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :temporary_id, :string
    add_column :reservations, :is_confirmed, :boolean
  end
end
