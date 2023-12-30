class CreateCareerGuidanceSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :career_guidance_sessions do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.references :professional, null: false, foreign_key: true

      t.timestamps
    end
  end
end
