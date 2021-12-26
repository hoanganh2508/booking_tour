class AddStatusToUserTours < ActiveRecord::Migration[6.1]
  def change
    add_column :user_tours, :status, :integer, default:0
  end
end
