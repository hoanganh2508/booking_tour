class RemoveTourIdFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :tour_id, :integer
  end
end
