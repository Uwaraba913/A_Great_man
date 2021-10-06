class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :end_user_id, null: false
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
