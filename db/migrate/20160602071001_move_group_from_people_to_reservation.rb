class MoveGroupFromPeopleToReservation < ActiveRecord::Migration
  def change
    remove_column :people, :group_id
    add_column :reservations, :group_id, :integer
  end
end
