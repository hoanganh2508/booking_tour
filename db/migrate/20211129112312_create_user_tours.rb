class CreateUserTours < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tours do |t|
      t.integer :price
      t.integer :user_id
      t.integer :tour_id

      t.timestamps
    end
  end
end
