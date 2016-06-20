class RemoveInviteesAndCompanions < ActiveRecord::Migration
  def change
    drop_table :invitees
    drop_table :companions
  end
end
