class SurnameFieldForOwnerhistories < ActiveRecord::Migration[5.0]
  def change
  	 	change_column :flats, :phone, :string
  		add_column :ownerhistories, :surname, :string
  end
end
