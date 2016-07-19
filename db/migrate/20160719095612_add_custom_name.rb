class AddCustomName < ActiveRecord::Migration
  def change
    add_column :reservations, :custom_name, :string
    add_index :reservations, [:customer_id, :custom_name], unique: true
  end
end
