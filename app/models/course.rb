class Course < ApplicationRecord
  belongs_to :creator, class_name: 'User', optional: true
  has_many :course_enrollments
  has_many :enrolled_users, through: :course_enrollments, source: :user
  has_many :quizzes
end
