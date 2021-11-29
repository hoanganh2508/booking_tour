class CreateUserRatingTours < ActiveRecord::Migration[6.1]
  def change
    create_table :user_rating_tours do |t|
      t.integer :user_id
      t.integer :tour_id
      t.string :rate

      t.timestamps
    end
  end
end
