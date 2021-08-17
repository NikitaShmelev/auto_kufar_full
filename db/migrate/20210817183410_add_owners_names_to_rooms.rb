class AddOwnersNamesToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :creator_name, :string
    add_column :rooms, :recipient_name, :string
  end
end
