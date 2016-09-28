class AddFieldsToTicketsAndUser < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :admin , :boolean
    add_column :tickets, :status, :boolean, default: false
    add_column :users, :orderby, :string, default: 'address'
  end
end
