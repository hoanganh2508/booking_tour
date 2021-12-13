class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    change_column :tours, :content, :text
  end
end
