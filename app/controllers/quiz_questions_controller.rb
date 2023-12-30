class QuizQuestionsController < ApplicationController
  before_action :set_quiz
  before_action :set_quiz_question, only: [:show, :edit, :update, :destroy]

  # GET /quizzes/:quiz_id/quiz_questions
  def index
    @quiz_questions = @quiz.quiz_questions
  end

  # GET /quizzes/:quiz_id/quiz_questions/1
  def show
  end

  # GET /quizzes/:quiz_id/quiz_questions/new
  def new
    @quiz_question = @quiz.quiz_questions.build
  end

  # POST /quizzes/:quiz_id/quiz_questions
  def create
    @quiz_question = @quiz.quiz_questions.build(quiz_question_params)
    if @quiz_question.save
      redirect_to [@quiz, @quiz_question], notice: 'Quiz question was successfully created.'
    else
      render :new
    end
  end

  # GET /quizzes/:quiz_id/quiz_questions/1/edit
  def edit
  end

  # PATCH/PUT /quizzes/:quiz_id/quiz_questions/1
  def update
    if @quiz_question.update(quiz_question_params)
      redirect_to [@quiz, @quiz_question], notice: 'Quiz question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /quizzes/:quiz_id/quiz_questions/1
  def destroy
    @quiz_question.destroy
    redirect_to quiz_quiz_questions_url(@quiz), notice: 'Quiz question was successfully destroyed.'
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def set_quiz_question
    @quiz_question = QuizQuestion.find(params[:id])
  end

  def quiz_question_params
    params.require(:quiz_question).permit(:question, :question_type)
  end
end
