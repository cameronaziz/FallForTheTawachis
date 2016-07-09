class AddResDefaultSizeToCust < ActiveRecord::Migration
  def change
    add_column :customers, :default_reservation_size, :integer
  end
end
