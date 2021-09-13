class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :title
      t.string :body
      t.integer :owner_id
      t.integer :user_id

      t.timestamps
    end
  end
end
