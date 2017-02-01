class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.order(id: :DESC)
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
  end

  # GET /issues/new
  def new
    @version_test =  params[:version_test] ? VersionTest.find(params[:version_test]) : nil
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
    @version_test = VersionTest.find(@issue.version_test_id)
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)
    @version_test = @issue.version_test
    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
        format.js { render 'close' }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
        format.js { render 'new' }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    
    @version_issues = @issue.version_test.version.issues.order(id: :desc)

    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
         format.js { render 'versionissues', version_issues: @version_issues }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
         format.js { render 'edit' }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:link, :done, :available_for_test, :real_problem, :version_test_id)
    end
end
