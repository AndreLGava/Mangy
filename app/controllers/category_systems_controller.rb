class CategorySystemsController < ApplicationController
  before_action :set_category_system, only: [:show, :edit, :update, :destroy]

  # GET /category_systems
  # GET /category_systems.json
  def index
    @category_systems = CategorySystem.all
  end

  # GET /category_systems/1
  # GET /category_systems/1.json
  def show
  end

  # GET /category_systems/new
  def new
    @category_system = CategorySystem.new
  end

  # GET /category_systems/1/edit
  def edit
  end

  # POST /category_systems
  # POST /category_systems.json
  def create
    @category_system = CategorySystem.new(category_system_params)

    respond_to do |format|
      if @category_system.save
        format.html { redirect_to @category_system, notice: 'Category system was successfully created.' }
        format.json { render :show, status: :created, location: @category_system }
      else
        format.html { render :new }
        format.json { render json: @category_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_systems/1
  # PATCH/PUT /category_systems/1.json
  def update
    respond_to do |format|
      if @category_system.update(category_system_params)
        format.html { redirect_to @category_system, notice: 'Category system was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_system }
      else
        format.html { render :edit }
        format.json { render json: @category_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_systems/1
  # DELETE /category_systems/1.json
  def destroy
    @category_system.destroy
    respond_to do |format|
      format.html { redirect_to category_systems_url, notice: 'Category system was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_system
      @category_system = CategorySystem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_system_params
      params.require(:category_system).permit(:sistem_id, :category_id)
    end
end
