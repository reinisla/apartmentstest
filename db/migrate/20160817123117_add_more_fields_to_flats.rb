class AddMoreFieldsToFlats < ActiveRecord::Migration[5.0]
  def change
    change_column :flats, :flat_nr, :string
    add_column :flats, :phone, :integer
    add_column :flats, :relatives, :string
    add_column :flats, :rooms, :integer
    add_column :flats, :morepersons, :string
    add_column :flats, :email, :string
  end
end
