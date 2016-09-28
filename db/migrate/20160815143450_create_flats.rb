class CreateFlats < ActiveRecord::Migration[5.0]
  def change
    create_table :flats do |t|
      t.string :content
      t.integer :user_id
      
      t.timestamps
    end
  end
end
