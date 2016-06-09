class ChangeValueFromStringToText < ActiveRecord::Migration
  def change
    change_column :email_configurations, :value, :text
  end
end
