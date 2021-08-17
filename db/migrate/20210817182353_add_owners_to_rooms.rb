class AddOwnersToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :creator_id, :integer
    add_column :rooms, :recipient_id, :integer
    add_column :rooms, :integer, :string
  end
end
