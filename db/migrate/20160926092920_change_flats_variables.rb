class ChangeFlatsVariables < ActiveRecord::Migration[5.0]
  def change
  	add_column :flats, :surname, :string
  	add_column :flats, :housenr, :string
  	add_column :flats, :status, :string

  	remove_column :flats, :rooms, :string
  end
end
