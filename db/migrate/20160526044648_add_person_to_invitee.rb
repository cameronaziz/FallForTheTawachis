class AddPersonToInvitee < ActiveRecord::Migration
  def change
    add_column :invitees, :person_id, :integer
    add_column :companions, :person_id, :integer
    remove_column :invitees, :first_name
    remove_column :invitees, :last_name
    remove_column :invitees, :meal_id
    remove_column :companions, :first_name
    remove_column :companions, :last_name
    remove_column :companions, :meal_id
  end
end
