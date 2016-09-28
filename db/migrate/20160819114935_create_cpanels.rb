class CreateCpanels < ActiveRecord::Migration[5.0]
  def change
    create_table :cpanels do |t|

      t.integer :user_id
      t.integer :property_id
      t.integer :flat_id
      t.timestamps
    end
  end
end
