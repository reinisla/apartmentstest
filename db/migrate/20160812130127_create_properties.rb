class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
