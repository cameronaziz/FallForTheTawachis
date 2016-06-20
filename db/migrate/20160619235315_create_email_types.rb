class CreateEmailTypes < ActiveRecord::Migration
  def change
    create_table :email_types do |t|
      t.string :type


      t.timestamps null: false
    end
  end
end
