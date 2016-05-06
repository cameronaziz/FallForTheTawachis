class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.belongs_to :customer
      t.string :name
      t.string :note
      t.integer :party_size
      t.timestamps null: false
    end
  end
end
