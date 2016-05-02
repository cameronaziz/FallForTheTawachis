class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.belongs_to :reservation
      t.string :first_name
      t.string :last_name
      t.string :full_name


      t.timestamps null: false
    end
  end
end
