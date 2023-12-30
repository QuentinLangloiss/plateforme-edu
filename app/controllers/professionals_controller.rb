class ProfessionalsController < ApplicationController
  before_action :set_professional, only: [:show, :edit, :update, :destroy]

  # GET /professionals
  def index
    @professionals = Professional.all
  end

  # GET /professionals/1
  def show
  end

  # GET /professionals/new
  def new
    @professional = Professional.new
  end

  # POST /professionals
  def create
    @professional = Professional.new(professional_params)
    if @professional.save
      redirect_to @professional, notice: 'Professional was successfully created.'
    else
      render :new
    end
  end

  # GET /professionals/1/edit
  def edit
  end

  # PATCH/PUT /professionals/1
  def update
    if @professional.update(professional_params)
      redirect_to @professional, notice: 'Professional was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /professionals/1
  def destroy
    @professional.destroy
    redirect_to professionals_url, notice: 'Professional was successfully destroyed.'
  end

  private

  def set_professional
    @professional = Professional.find(params[:id])
  end

  def professional_params
    params.require(:professional).permit(:name, :field, :description, :contact_info)
  end
end
