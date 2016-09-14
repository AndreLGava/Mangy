class VersionsController < ApplicationController
  before_action :set_version, only: [:show, :edit, :update, :destroy, :versiontests, :versionissues, :download, :history]
  after_action :set_new_version, only: [:create]

  # GET /versions
  # GET /versions.json
  def index
    @versions = Version.all.order(id: :desc)
  end

  # GET /versions/1
  # GET /versions/1.json
  def show
  end

  def versiontests
    @version_tests = @version.version_tests
    #@version_tests = VersionTest.where(version_id: @version).includes('test').order('tests.part ASC')
    @done          = @version.version_tests.where(check: true).count
    @all           = @version_tests.count
    @to_do         = @version.version_tests.where(check: false).count
  end

  def download
    @version_tests = VersionTest.where(version_id: @version).includes('test').order('tests.part ASC')
    respond_to do |format|
     # format.csv { send_data @version_tests.to_csv }
      format.xls  #{ send_data @version_tests.to_csv(col_sep: "\t") }
    end
  end

  def versionissues
    @version_issues = @version.issues.order(id: :desc)
  end

  def history
    @test = params[:test]
    @history = VersionTest.where(test_id: @test).last(10).reverse
  end

  def linked_issues
    @test = params[:test]
    @linked_issues = Test.find(@test).issues.reverse
  end

  # GET /versions/new
  def new
    @version = Version.new
  end

  # GET /versions/1/edit
  def edit
  end

  # POST /versions
  # POST /versions.json
  def create
    @version = Version.new(version_params)

    respond_to do |format|
      if @version.save
        format.html { redirect_to @version, notice: 'Version was successfully created.' }
        format.json { render :show, status: :created, location: @version }
      else
        format.html { render :new }
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /versions/1
  # PATCH/PUT /versions/1.json
  def update
    respond_to do |format|
      if @version.update(version_params)
        format.html { redirect_to @version, notice: 'Version was successfully updated.' }
        format.json { render :show, status: :ok, location: @version }
      else
        format.html { render :edit }
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /versions/1
  # DELETE /versions/1.json
  def destroy
    @version.destroy
    respond_to do |format|
      format.html { redirect_to versions_url, notice: 'Version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_version
      @version = Version.find(params[:id])
    end

    def set_new_version
      @tests = Test.rank(:row_order).all
      @tests.each do |t|
        VersionTest.create(obtained_result: '--', impact: '--', test_id: t.id, version_id: @version.id)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def version_params
      params.require(:version).permit(:responsable, :used_user, :system, :observation, :impediment, :start, :finish)
    end
end
