class AddUrlToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :url, :string
  end
end
