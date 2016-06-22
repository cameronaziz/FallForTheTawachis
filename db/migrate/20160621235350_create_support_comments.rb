class CreateSupportComments < ActiveRecord::Migration
  def change
    create_table :support_comments do |t|
      t.belongs_to :support_ticket
      t.belongs_to :user
      t.string :comment


      t.timestamps null: false
    end
  end
end
