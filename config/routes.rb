Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Routes pour les cours
  resources :courses do
    resources :quizzes
  end

  # Routes pour les inscriptions aux cours
  resources :course_enrollments

  # Routes pour les quiz et leurs questions
  resources :quizzes do
    resources :quiz_questions do
      resources :question_answers
    end
    resources :quiz_results
  end

  # Routes pour les professionnels et les opportunités de carrière
  resources :professionals do
    resources :career_opportunities
    resources :career_guidance_sessions
  end

  # Routes pour les intérêts des utilisateurs
  resources :user_interests
end
