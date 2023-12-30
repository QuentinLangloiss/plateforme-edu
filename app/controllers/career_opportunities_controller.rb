class CareerOpportunitiesController < ApplicationController
  before_action :set_professional
  before_action :set_career_opportunity, only: [:show, :edit, :update, :destroy]

  # GET /professionals/:professional_id/career_opportunities
  def index
    @career_opportunities = @professional.career_opportunities
  end

  # GET /professionals/:professional_id/career_opportunities/1
  def show
  end

  # GET /professionals/:professional_id/career_opportunities/new
  def new
    @career_opportunity = @professional.career_opportunities.build
  end

  # POST /professionals/:professional_id/career_opportunities
  def create
    @career_opportunity = @professional.career_opportunities.build(career_opportunity_params)
    if @career_opportunity.save
      redirect_to [@professional, @career_opportunity], notice: 'Career opportunity was successfully created.'
    else
      render :new
    end
  end

  # GET /professionals/:professional_id/career_opportunities/1/edit
  def edit
  end

  # PATCH/PUT /professionals/:professional_id/career_opportunities/1
  def update
    if @career_opportunity.update(career_opportunity_params)
      redirect_to [@professional, @career_opportunity], notice: 'Career opportunity was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /professionals/:professional_id/career_opportunities/1
  def destroy
    @career_opportunity.destroy
    redirect_to professional_career_opportunities_url(@professional), notice: 'Career opportunity was successfully destroyed.'
  end

  private

  def set_professional
    @professional = Professional.find(params[:professional_id])
  end

  def set_career_opportunity
    @career_opportunity = CareerOpportunity.find(params[:id])
  end

  def career_opportunity_params
    params.require(:career_opportunity).permit(:title, :description)
  end
end
