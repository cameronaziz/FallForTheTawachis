class AddFieldsToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :from_email, :string

  end
end
