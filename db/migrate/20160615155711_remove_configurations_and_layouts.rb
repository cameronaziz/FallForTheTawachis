class RemoveConfigurationsAndLayouts < ActiveRecord::Migration
  def change
    drop_table :layouts
    drop_table :configurations
  end
end
