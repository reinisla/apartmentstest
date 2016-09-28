class PropertyImageToProperty < ActiveRecord::Migration[5.0]
  def change
  	add_column :properties, :property_image, :string
  	add_column :properties, :zipcode, :integer
  	add_column :properties, :city, :string
  	add_column :properties, :housename, :string
  	add_column :properties, :surname, :string
  	remove_column :properties, :content, :string


  end
end
