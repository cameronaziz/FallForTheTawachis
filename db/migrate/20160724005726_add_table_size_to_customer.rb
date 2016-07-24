class AddTableSizeToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :table_size, :integer
  end
end
