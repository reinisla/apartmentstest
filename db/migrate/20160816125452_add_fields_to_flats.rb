class AddFieldsToFlats < ActiveRecord::Migration[5.0]
  def change
  	add_column :flats, :name, :string
    add_column :flats, :flat_nr, :integer
    add_column :flats, :join_date, :datetime
    add_column :flats, :caretaker, :string
  end
end
