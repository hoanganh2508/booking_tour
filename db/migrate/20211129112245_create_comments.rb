class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :tour_id
      t.integer :user_id
      t.string :content
      t.integer :parent_id

      t.timestamps
    end
  end
end
