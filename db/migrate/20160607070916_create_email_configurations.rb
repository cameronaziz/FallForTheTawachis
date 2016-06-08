class CreateEmailConfigurations < ActiveRecord::Migration
  def change
    create_table :email_configurations do |t|
      t.belongs_to :customer
      t.belongs_to :email_template
      t.integer :field_id
      t.string :name
      t.string :value
      t.timestamps null: false
    end
  end
end
