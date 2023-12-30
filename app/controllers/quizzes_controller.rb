class QuizzesController < ApplicationController
  before_action :set_course
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  # GET /courses/:course_id/quizzes
  def index
    @quizzes = @course.quizzes
  end

  # GET /courses/:course_id/quizzes/1
  def show
  end

  # GET /courses/:course_id/quizzes/new
  def new
    @quiz = @course.quizzes.build
  end

  # POST /courses/:course_id/quizzes
  def create
    @quiz = @course.quizzes.build(quiz_params)
    if @quiz.save
      redirect_to [@course, @quiz], notice: 'Quiz was successfully created.'
    else
      render :new
    end
  end

  # GET /courses/:course_id/quizzes/1/edit
  def edit
  end

  # PATCH/PUT /courses/:course_id/quizzes/1
  def update
    if @quiz.update(quiz_params)
      redirect_to [@course, @quiz], notice: 'Quiz was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /courses/:course_id/quizzes/1
  def destroy
    @quiz.destroy
    redirect_to course_quizzes_url(@course), notice: 'Quiz was successfully destroyed.'
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :description)
  end
end
