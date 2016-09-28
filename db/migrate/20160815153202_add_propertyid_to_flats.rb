class AddPropertyidToFlats < ActiveRecord::Migration[5.0]
  def change
  	 add_column :flats, :property_id, :integer
  end
end
