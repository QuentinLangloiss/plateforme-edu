class Quiz < ApplicationRecord
  belongs_to :course
  has_many :quiz_questions
  has_many :quiz_results
end
