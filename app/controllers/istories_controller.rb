class IstoriesController < ApplicationController
  before_action :set_istory, only: [:show, :edit, :update, :destroy]

  # GET /istories
  # GET /istories.json
  def index
    @istories = Istory.all
  end

  # GET /istories/1
  # GET /istories/1.json
  def show
  end

  # GET /istories/new
  def new
    @istory = Istory.new
  end

  # GET /istories/1/edit
  def edit
  end

  # POST /istories
  # POST /istories.json
  def create
    @istory = Istory.new(istory_params)

    respond_to do |format|
      if @istory.save
        format.html { redirect_to @istory, notice: 'Istory was successfully created.' }
        format.json { render :show, status: :created, location: @istory }
      else
        format.html { render :new }
        format.json { render json: @istory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /istories/1
  # PATCH/PUT /istories/1.json
  def update
    respond_to do |format|
      if @istory.update(istory_params)
        format.html { redirect_to @istory, notice: 'Istory was successfully updated.' }
        format.json { render :show, status: :ok, location: @istory }
      else
        format.html { render :edit }
        format.json { render json: @istory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /istories/1
  # DELETE /istories/1.json
  def destroy
    @istory.destroy
    respond_to do |format|
      format.html { redirect_to istories_url, notice: 'Istory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_istory
      @istory = Istory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def istory_params
      params.require(:istory).permit(:url, :sprint_id, :category_id, :description)
    end
end
