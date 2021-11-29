class CreateUserLikeTours < ActiveRecord::Migration[6.1]
  def change
    create_table :user_like_tours do |t|
      t.integer :user_id
      t.integer :tour_id

      t.timestamps
    end
  end
end
