class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :address
      t.string :name
      t.integer :phone
      t.string :email
      t.string :selection
      t.integer :flat_nr
      t.integer :user_id
      t.string :content
      t.string :subject
      t.timestamps
    end
  end
end
