class RastreamentosController < ApplicationController
  before_action :set_rastreamento, only: [:show, :edit, :update, :destroy]

  # GET /rastreamentos
  # GET /rastreamentos.json
  def index
    @rastreamentos = Rastreamento.all
  end

  # GET /rastreamentos/1
  # GET /rastreamentos/1.json
  def show
  end

  # GET /rastreamentos/new
  def new
    @rastreamento = Rastreamento.new
  end

  # GET /rastreamentos/1/edit
  def edit
  end

  # POST /rastreamentos
  # POST /rastreamentos.json
  def create
    @rastreamento = Rastreamento.new(rastreamento_params)

    respond_to do |format|
      if @rastreamento.save
        format.html { redirect_to @rastreamento, notice: 'Rastreamento was successfully created.' }
        format.json { render :show, status: :created, location: @rastreamento }
      else
        format.html { render :new }
        format.json { render json: @rastreamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rastreamentos/1
  # PATCH/PUT /rastreamentos/1.json
  def update
    respond_to do |format|
      if @rastreamento.update(rastreamento_params)
        format.html { redirect_to @rastreamento, notice: 'Rastreamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @rastreamento }
      else
        format.html { render :edit }
        format.json { render json: @rastreamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rastreamentos/1
  # DELETE /rastreamentos/1.json
  def destroy
    @rastreamento.destroy
    respond_to do |format|
      format.html { redirect_to rastreamentos_url, notice: 'Rastreamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rastreamento
      @rastreamento = Rastreamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rastreamento_params
      params.require(:rastreamento).permit(:time, :pessoa_id, :issue_id, :status_id)
    end
end
