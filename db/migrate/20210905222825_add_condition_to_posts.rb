class AddConditionToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :condition, :string
  end
end
