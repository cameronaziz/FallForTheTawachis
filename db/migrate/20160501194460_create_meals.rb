class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.belongs_to :customer
      t.string :name
      t.boolean :is_vegetarian
      t.timestamps null: false
    end
  end
end
