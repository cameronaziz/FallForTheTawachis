class AddToReservationIdToPerson < ActiveRecord::Migration
  def change
    add_column :people, :reservation_id, :integer
  end
end
