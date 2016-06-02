class ChangeTemporaryIdToPublicId < ActiveRecord::Migration
  def change
    rename_column :reservations, :temporary_id, :public_id
  end
end
