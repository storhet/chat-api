class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message, null: false
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false

      t.timestamps null: false
    end
  end
end
