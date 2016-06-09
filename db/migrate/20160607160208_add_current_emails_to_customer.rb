class AddCurrentEmailsToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :current_confirmation, :integer
    add_column :customers, :current_invitation, :integer
  end
end
