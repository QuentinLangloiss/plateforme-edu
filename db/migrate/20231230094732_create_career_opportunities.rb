class CreateCareerOpportunities < ActiveRecord::Migration[7.0]
  def change
    create_table :career_opportunities do |t|
      t.string :title
      t.text :description
      t.references :professional, null: false, foreign_key: true

      t.timestamps
    end
  end
end
