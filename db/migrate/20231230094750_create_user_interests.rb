class CreateUserInterests < ActiveRecord::Migration[7.0]
  def change
    create_table :user_interests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :field
      t.integer :level_of_interest

      t.timestamps
    end
  end
end
