class AddPriceToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :price, :real, :default => 0.0

  end
end
