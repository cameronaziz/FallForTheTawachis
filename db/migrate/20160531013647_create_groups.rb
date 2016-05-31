class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.belongs_to :customer
      t.string :name
      t.timestamps null: false
    end
  end
end
