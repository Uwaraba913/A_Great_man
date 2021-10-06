class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.integer :admin_id
      t.integer :end_user_id
      t.integer :attribute_id, null: false
      t.integer :person_profile_id
      t.string :person_image_id
      t.string :person_name
      t.text :content

      t.timestamps
    end
  end
end
