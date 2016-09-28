class AddNameToProperties < ActiveRecord::Migration[5.0]
  def change
  	 add_column :properties, :name, :string
  	 add_column :properties, :address, :string
  end
end
