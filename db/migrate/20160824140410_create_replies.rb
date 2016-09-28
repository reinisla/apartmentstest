class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.text :content
      t.integer :user_id
      t.integer :ticket_id
      t.timestamps
    end

    add_column :tickets, :reply_id, :integer
  end
end
