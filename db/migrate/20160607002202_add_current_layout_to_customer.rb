class AddCurrentLayoutToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :current_layout, :integer
  end
end
