class AddFirstnameAndSecondnameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
  end
end
