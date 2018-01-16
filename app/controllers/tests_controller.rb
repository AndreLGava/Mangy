class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  after_action :set_new_origins, only: [:create]
  after_action :set_new_pre, only: [:create]

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.rank(:row_order).all
  end
  def update_row_order
    @test = Test.find(test_params[:test_id])
    @test.row_order_position = test_params[:row_order_position]
    @test.save

    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end
  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    unless params[:category].nil?
      @category  = Category.find(params[:category]) 
      @test = @category.tests.new
    else
      @test = Test.new
    end
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @origin = test_params[:origin_ids]
    @pre = test_params[:pre_ids]
    params[:test].delete :origin_ids
    params[:test].delete :pre_ids
    @test = Test.new(test_params)
    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render :new, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_new_origins
      @origin = @origin.sort
      @origin.each do |c|
        Context.create(origin_id_id: c, destiny_id_id: @test.id)
      end
    end

    def set_new_pre
      @pre = @pre.sort
      @pre.each do |c|
        Dependency.create(pre_id: c, pos_id: @test.id)
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:test_id, :description, :row_order_position, :settings, :file, :expected_result, :status, :part, :category_id, origin_ids: [], pre_ids: [])
    end
end
