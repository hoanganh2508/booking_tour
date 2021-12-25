class AddDurationToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :duration, :string
  end
end
