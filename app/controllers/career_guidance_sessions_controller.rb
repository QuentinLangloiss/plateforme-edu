class CareerGuidanceSessionsController < ApplicationController
  before_action :set_professional
  before_action :set_career_guidance_session, only: [:show, :edit, :update, :destroy]

  # GET /professionals/:professional_id/career_guidance_sessions
  def index
    @career_guidance_sessions = @professional.career_guidance_sessions
  end

  # GET /professionals/:professional_id/career_guidance_sessions/1
  def show
  end

  # GET /professionals/:professional_id/career_guidance_sessions/new
  def new
    @career_guidance_session = @professional.career_guidance_sessions.build
  end

  # POST /professionals/:professional_id/career_guidance_sessions
  def create
    @career_guidance_session = @professional.career_guidance_sessions.build(career_guidance_session_params)
    if @career_guidance_session.save
      redirect_to [@professional, @career_guidance_session], notice: 'Career guidance session was successfully created.'
    else
      render :new
    end
  end

  # GET /professionals/:professional_id/career_guidance_sessions/1/edit
  def edit
  end

  # PATCH/PUT /professionals/:professional_id/career_guidance_sessions/1
  def update
    if @career_guidance_session.update(career_guidance_session_params)
      redirect_to [@professional, @career_guidance_session], notice: 'Career guidance session was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /professionals/:professional_id/career_guidance_sessions/1
  def destroy
    @career_guidance_session.destroy
    redirect_to professional_career_guidance_sessions_url(@professional), notice: 'Career guidance session was successfully destroyed.'
  end

  private

  def set_professional
    @professional = Professional.find(params[:professional_id])
  end

  def set_career_guidance_session
    @career_guidance_session = CareerGuidanceSession.find(params[:id])
  end

  def career_guidance_session_params
    params.require(:career_guidance_session).permit(:title, :description, :date)
  end
end
