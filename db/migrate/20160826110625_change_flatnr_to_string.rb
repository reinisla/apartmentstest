class ChangeFlatnrToString < ActiveRecord::Migration[5.0]
  def change
  	 change_column :tickets, :flat_nr, :string
  	 add_column :tickets, :surname, :string
  end
end
