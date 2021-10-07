class CreatePersonProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :person_profiles do |t|
      t.string :image_id
      t.string :name, null: false

      t.timestamps
    end
  end
end
