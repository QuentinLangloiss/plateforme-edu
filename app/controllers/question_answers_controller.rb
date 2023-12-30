class QuestionAnswersController < ApplicationController
  before_action :set_quiz_question
  before_action :set_question_answer, only: [:show, :edit, :update, :destroy]

  # GET /quiz_questions/:quiz_question_id/question_answers
  def index
    @question_answers = @quiz_question.question_answers
  end

  # GET /quiz_questions/:quiz_question_id/question_answers/1
  def show
  end

  # GET /quiz_questions/:quiz_question_id/question_answers/new
  def new
    @question_answer = @quiz_question.question_answers.build
  end

  # POST /quiz_questions/:quiz_question_id/question_answers
  def create
    @question_answer = @quiz_question.question_answers.build(question_answer_params)
    if @question_answer.save
      redirect_to [@quiz_question, @question_answer], notice: 'Answer was successfully created.'
    else
      render :new
    end
  end

  # GET /quiz_questions/:quiz_question_id/question_answers/1/edit
  def edit
  end

  # PATCH/PUT /quiz_questions/:quiz_question_id/question_answers/1
  def update
    if @question_answer.update(question_answer_params)
      redirect_to [@quiz_question, @question_answer], notice: 'Answer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /quiz_questions/:quiz_question_id/question_answers/1
  def destroy
    @question_answer.destroy
    redirect_to quiz_question_question_answers_url(@quiz_question), notice: 'Answer was successfully destroyed.'
  end

  private

  def set_quiz_question
    @quiz_question = QuizQuestion.find(params[:quiz_question_id])
  end

  def set_question_answer
    @question_answer = QuestionAnswer.find(params[:id])
  end

  def question_answer_params
    params.require(:question_answer).permit(:answer, :correct)
  end
end
