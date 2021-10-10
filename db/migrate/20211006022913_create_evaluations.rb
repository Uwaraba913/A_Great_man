class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer :end_user_id, null: false
      t.integer :quote_id, null: false
      t.integer :status

      t.timestamps
    end
  end
end
