class RetiresController < ApplicationController
  before_action :set_retire, only: [:show, :edit, :update, :destroy]

  # GET /retires
  # GET /retires.json
  def index
    @retires = Retire.all
  end

  # GET /retires/1
  # GET /retires/1.json
  def show
  end

  # GET /retires/new
  def new
    @retire = Retire.new
  end

  # GET /retires/1/edit
  def edit
  end

  # POST /retires
  # POST /retires.json
  def create
    @retire = Retire.new(retire_params)

    respond_to do |format|
      if @retire.save
        format.html { redirect_to @retire, notice: 'Retire was successfully created.' }
        format.json { render :show, status: :created, location: @retire }
      else
        format.html { render :new }
        format.json { render json: @retire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /retires/1
  # PATCH/PUT /retires/1.json
  def update
    respond_to do |format|
      if @retire.update(retire_params)
        format.html { redirect_to @retire, notice: 'Retire was successfully updated.' }
        format.json { render :show, status: :ok, location: @retire }
      else
        format.html { render :edit }
        format.json { render json: @retire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /retires/1
  # DELETE /retires/1.json
  def destroy
    @retire.destroy
    respond_to do |format|
      format.html { redirect_to retires_url, notice: 'Retire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retire
      @retire = Retire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def retire_params
      params.require(:retire).permit(:user_id, :telephone)
    end
end
