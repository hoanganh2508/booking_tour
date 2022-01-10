class FixColumnRate < ActiveRecord::Migration[6.1]
  def change
    change_column :user_rating_tours, :rate, :integer
  end
end
