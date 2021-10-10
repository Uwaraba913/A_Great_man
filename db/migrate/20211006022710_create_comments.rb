class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :end_user_id, null: false
      t.integer :quote_id, null: false
      t.text :quote_comment

      t.timestamps
    end
  end
end
