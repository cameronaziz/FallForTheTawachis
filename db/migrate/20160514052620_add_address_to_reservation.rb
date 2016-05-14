class AddAddressToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :address, :string
    add_column :reservations, :city, :string
    add_column :reservations, :state, :string
    add_column :reservations, :zip, :string
  end
end
