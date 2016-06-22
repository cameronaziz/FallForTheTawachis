class CreateSupportTickets < ActiveRecord::Migration
  def change
    create_table :support_tickets do |t|
      t.belongs_to :customer
      t.integer :created_by
      t.string :title
      t.string :description
      t.boolean :is_closed


      t.timestamps null: false
    end
  end
end
