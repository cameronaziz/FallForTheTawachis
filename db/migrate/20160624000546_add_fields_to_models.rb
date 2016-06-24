class AddFieldsToModels < ActiveRecord::Migration
  def change
    add_column :users, :is_administrator, :boolean
    add_column :customers, :multiplier, :integer
  end
end
