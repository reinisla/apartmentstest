class CreateMainhistories < ActiveRecord::Migration[5.0]
  def change
    create_table :mainhistories do |t|
      t.text :problem
      t.string :name
      t.string :surname
      t.datetime :fix_date
      t.integer :user_id
      t.integer :flat_id
      t.timestamps
    end
  end
end
