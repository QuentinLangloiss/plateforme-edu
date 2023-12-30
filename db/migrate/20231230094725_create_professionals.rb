class CreateProfessionals < ActiveRecord::Migration[7.0]
  def change
    create_table :professionals do |t|
      t.string :name
      t.string :field
      t.text :description
      t.string :contact_info

      t.timestamps
    end
  end
end
