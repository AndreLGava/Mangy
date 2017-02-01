class SistemsController < ApplicationController
  before_action :set_sistem, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit, :update, :create]

  # GET /sistems
  # GET /sistems.json
  def index
    @sistems = Sistem.all.order(description: :ASC)
  end

  # GET /sistems/1
  # GET /sistems/1.json
  def show
  end

  # GET /sistems/new
  def new
    @sistem = Sistem.new
  end

  # GET /sistems/1/edit
  def edit
  end

  # POST /sistems
  # POST /sistems.json
  def create
    
    @sistem = Sistem.new(sistem_params)

    respond_to do |format|
      if @sistem.save
        associate_categories
        format.html { redirect_to @sistem, notice: 'Sistem was successfully created.' }
        format.json { render :show, status: :created, location: @sistem }
      else
        format.html { render :new }
        format.json { render json: @sistem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sistems/1
  # PATCH/PUT /sistems/1.json
  def update
    
    respond_to do |format|
      if @sistem.update(sistem_params)
        associate_categories
        format.html { redirect_to @sistem, notice: 'Sistem was successfully updated.' }
        format.json { render :show, status: :ok, location: @sistem }
      else
        format.html { render :edit }
        format.json { render json: @sistem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sistems/1
  # DELETE /sistems/1.json
  def destroy
    @sistem.destroy
    respond_to do |format|
      format.html { redirect_to sistems_url, notice: 'Sistem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def associate_categories
    @sistem.categories << sistem_params(:categories)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sistem
      @sistem = Sistem.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def sistem_params
      params.require(:sistem).permit(:description, :categories)
    end
end
