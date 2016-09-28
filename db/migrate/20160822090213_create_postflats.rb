class CreatePostflats < ActiveRecord::Migration[5.0]
  def change
    create_table :postflats do |t|

      t.timestamps
    end
  end
end
