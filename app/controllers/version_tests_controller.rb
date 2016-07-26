class VersionTestsController < ApplicationController
  before_action :set_version_test, only: [:show, :edit, :update, :destroy]

  # GET /version_tests
  # GET /version_tests.json
  def index
    @version_tests = VersionTest.all
  end

  # GET /version_tests/1
  # GET /version_tests/1.json
  def show
  end

  # GET /version_tests/new
  def new
    @version_test = VersionTest.new
  end

  # GET /version_tests/1/edit
  def edit
  end

  # POST /version_tests
  # POST /version_tests.json
  def create
    @version_test = VersionTest.new(version_test_params)

    respond_to do |format|
      if @version_test.save
        format.html { redirect_to @version_test, notice: 'Version test was successfully created.' }
        format.json { render :show, status: :created, location: @version_test }
      else
        format.html { render :new }
        format.json { render json: @version_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /version_tests/1
  # PATCH/PUT /version_tests/1.json
  def update
    respond_to do |format|
      if @version_test.update(version_test_params)
        format.html { redirect_to @version_test, notice: 'Version test was successfully updated.' }
        format.json { render :show, status: :ok, location: @version_test }
        format.js { render 'close' }
      else
        format.html { render :edit }
        format.json { render json: @version_test.errors, status: :unprocessable_entity }
        format.js { render 'edit' }
      end
    end
  end

  # DELETE /version_tests/1
  # DELETE /version_tests/1.json
  def destroy
    @id = @version_test.version_id
    @version_test.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Version test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_version_test
      @version_test = VersionTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def version_test_params
      params.require(:version_test).permit(:obtained_result, :impact, :check, :version_id, :test_id)
    end
end
