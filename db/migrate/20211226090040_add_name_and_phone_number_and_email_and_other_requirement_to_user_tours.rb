class AddNameAndPhoneNumberAndEmailAndOtherRequirementToUserTours < ActiveRecord::Migration[6.1]
  def change
    add_column :user_tours, :name, :string
    add_column :user_tours, :phone_number, :integer
    add_column :user_tours, :email, :string
    add_column :user_tours, :other_requirement, :text
  end
end
