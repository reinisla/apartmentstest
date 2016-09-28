class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :attachment
      t.integer :property_id, null: false
      

      t.timestamps
    end
  end
end
