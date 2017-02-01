class TecnologiesController < ApplicationController
  before_action :set_tecnology, only: [:show, :edit, :update, :destroy]

  # GET /tecnologies
  # GET /tecnologies.json
  def index
    @tecnologies = Tecnology.all
  end

  # GET /tecnologies/1
  # GET /tecnologies/1.json
  def show
  end

  # GET /tecnologies/new
  def new
    @tecnology = Tecnology.new
  end

  # GET /tecnologies/1/edit
  def edit
  end

  # POST /tecnologies
  # POST /tecnologies.json
  def create
    @tecnology = Tecnology.new(tecnology_params)

    respond_to do |format|
      if @tecnology.save
        format.html { redirect_to @tecnology, notice: 'Tecnology was successfully created.' }
        format.json { render :show, status: :created, location: @tecnology }
      else
        format.html { render :new }
        format.json { render json: @tecnology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tecnologies/1
  # PATCH/PUT /tecnologies/1.json
  def update
    respond_to do |format|
      if @tecnology.update(tecnology_params)
        format.html { redirect_to @tecnology, notice: 'Tecnology was successfully updated.' }
        format.json { render :show, status: :ok, location: @tecnology }
      else
        format.html { render :edit }
        format.json { render json: @tecnology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tecnologies/1
  # DELETE /tecnologies/1.json
  def destroy
    @tecnology.destroy
    respond_to do |format|
      format.html { redirect_to tecnologies_url, notice: 'Tecnology was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tecnology
      @tecnology = Tecnology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tecnology_params
      params.require(:tecnology).permit(:description)
    end
end
