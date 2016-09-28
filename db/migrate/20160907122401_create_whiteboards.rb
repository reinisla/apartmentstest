class CreateWhiteboards < ActiveRecord::Migration[5.0]
  def change
    create_table :whiteboards do |t|
      t.text :content
      t.integer :user_id
      t.integer :property_id
      t.timestamps
      
    end
  end
end
