class QuizResultsController < ApplicationController
  before_action :set_quiz
  before_action :set_quiz_result, only: [:show, :edit, :update, :destroy]

  # GET /quizzes/:quiz_id/quiz_results
  def index
    @quiz_results = @quiz.quiz_results
  end

  # GET /quizzes/:quiz_id/quiz_results/1
  def show
  end

  # GET /quizzes/:quiz_id/quiz_results/new
  def new
    @quiz_result = @quiz.quiz_results.build
  end

  # POST /quizzes/:quiz_id/quiz_results
  def create
    @quiz_result = @quiz.quiz_results.build(quiz_result_params)
    if @quiz_result.save
      redirect_to [@quiz, @quiz_result], notice: 'Quiz result was successfully created.'
    else
      render :new
    end
  end

  # GET /quizzes/:quiz_id/quiz_results/1/edit
  def edit
  end

  # PATCH/PUT /quizzes/:quiz_id/quiz_results/1
  def update
    if @quiz_result.update(quiz_result_params)
      redirect_to [@quiz, @quiz_result], notice: 'Quiz result was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /quizzes/:quiz_id/quiz_results/1
  def destroy
    @quiz_result.destroy
    redirect_to quiz_quiz_results_url(@quiz), notice: 'Quiz result was successfully destroyed.'
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def set_quiz_result
    @quiz_result = QuizResult.find(params[:id])
  end

  def quiz_result_params
    params.require(:quiz_result).permit(:user_id, :score, :date)
  end
end
