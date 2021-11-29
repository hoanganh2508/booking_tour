class CreateTours < ActiveRecord::Migration[6.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.integer :price
      t.integer :category_id
      t.string :content

      t.timestamps
    end
  end
end
