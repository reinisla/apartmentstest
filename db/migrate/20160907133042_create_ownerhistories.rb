class CreateOwnerhistories < ActiveRecord::Migration[5.0]
  def change
    create_table :ownerhistories do |t|
      t.string :name
      t.string :email
      t.datetime :move_out_date
      t.datetime :move_in_date
      t.integer :user_id
      t.integer :property_id
      t.integer :flat_id
      t.timestamps
    end
    add_column :flats, :ownerhistory_id, :integer
  end
end
