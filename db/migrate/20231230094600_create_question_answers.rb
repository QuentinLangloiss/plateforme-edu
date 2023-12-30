class CreateQuestionAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :question_answers do |t|
      t.references :quiz_question, null: false, foreign_key: true
      t.text :answer
      t.boolean :correct

      t.timestamps
    end
  end
end
