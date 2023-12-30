class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :created_courses, class_name: 'Course', foreign_key: 'creator_id'

  has_many :course_enrollments
  has_many :enrolled_courses, through: :course_enrollments, source: :course

  has_many :quiz_results
  has_many :taken_quizzes, through: :quiz_results, source: :quiz

  has_many :user_interests
end
