class AddEmailTypeToTemplate < ActiveRecord::Migration
  def change
    add_column :email_templates, :email_type_id, :integer
  end
end
