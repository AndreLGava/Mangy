class VersionTestsController < ApplicationController
  before_action :set_version_test, only: [:show, :edit, :update, :destroy]

  def index
    @version_tests = VersionTest.all
  end

  def check
    @test = VersionTest.find(params[:id])
    @check = params[:checked]
    @version = Version.find(@test.version_id)
    @version_tests = @version.version_tests
    @test.update_attributes(check: @check)
    render :nothing => true
      #respond_to do |format|
       # if @test.update_attributes(check: @check)
        #  @done          = @version.version_tests.where(check: true).count
         # @all           = @version_tests.count
          #@to_do         = @version.version_tests.where(check: false).count
          #format.js { render 'versiontests', version_tests: @version_tests }
        #else
         # format.js { render 'edit' }
        #end
     # end
  end

  def show
  end

  def new
    @version_test = VersionTest.new
    @version = params[:version]
    @test_available = Test.all - Version.find(@version).version_tests.all.map(&:test)
  end

  def set_all_tests
    @version = params[:version]
    @tests = Test.all - Version.find(@version).version_tests.all.map(&:test)
    @tests.each do |t|
      VersionTest.create(obtained_result: '--', impact: '--', test_id: t.id, version_id: @version)
    end
    redirect_to :back
  end

  def edit
    @version = @version_test.version_id
  end

  def create
    @version_test = VersionTest.new(version_test_params)
    @version_tests = @version_test.version.version_tests
    @version = @version_test.version_id
    respond_to do |format|
      if @version_test.save
        format.html { redirect_to @version_test, notice: 'Version test was successfully created.' }
        format.json { render :show, status: :created, location: @version_test }
        format.js { render 'versiontests', version: @version }
      else
        format.html { render :new }
        format.json { render json: @version_test.errors, status: :unprocessable_entity }
      end
        format.js { render 'new' }
    end
  end

  def update
    @version = Version.find(@version_test.version_id)
    @version_tests = @version.version_tests
    respond_to do |format|
      if @version_test.update(version_test_params)
          @done          = @version.version_tests.where(check: true).count
          @all           = @version_tests.count
          @to_do         = @version.version_tests.where(check: false).count
        format.html { redirect_to @version_test, notice: 'Version test was successfully updated.' }
        format.json { render :show, status: :ok, location: @version_test }
        format.js { render 'versiontests', version_tests: @version_tests }
      else
        format.html { render :edit }
        format.json { render json: @version_test.errors, status: :unprocessable_entity }
        format.js { render 'edit' }
      end
    end
  end

  def destroy
    @id = @version_test.version_id
    @version_test.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Version test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_version_test
      @version_test = VersionTest.find(params[:id])
    end

    def version_test_params
      params.require(:version_test).permit(:obtained_result, :impact, :check, :version_id, :test_id)
    end
end
