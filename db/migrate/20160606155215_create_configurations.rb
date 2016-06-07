class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.belongs_to :customer
      t.belongs_to :layout

      t.timestamps null: false
    end
  end
end