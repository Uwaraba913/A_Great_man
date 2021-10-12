class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :title
      t.text :content
      t.integer :end_user_id

      t.timestamps
    end
  end
end
