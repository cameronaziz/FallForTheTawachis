class CreateEmailTemplates < ActiveRecord::Migration
  def change
    create_table :email_templates do |t|
      t.string :name
      t.text :html
      t.boolean :use_database
      t.timestamps null: false
    end
  end
end