class SpecificGravitiesController < ApplicationController
  before_action :set_specific_gravity, only: [:show, :edit, :update, :destroy]
  before_action :set_batch

  # GET /specific_gravities
  # GET /specific_gravities.json
  def index
    @specific_gravities = @batch.specific_gravities
  end

  # GET /specific_gravities/1
  # GET /specific_gravities/1.json
  def show
  end

  # GET /specific_gravities/new
  def new
    @specific_gravity = @batch.specific_gravities.build
  end

  # GET /specific_gravities/1/edit
  def edit
  end

  # POST /specific_gravities
  # POST /specific_gravities.json
  def create
    @specific_gravity = SpecificGravity.new(specific_gravity_params)

    respond_to do |format|
      if @specific_gravity.save
        format.html { redirect_to @batch, notice: 'Specific gravity was successfully created.' }
        format.json { render :show, status: :created, location: @specific_gravity }
      else
        format.html { render :new }
        format.json { render json: @specific_gravity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specific_gravities/1
  # PATCH/PUT /specific_gravities/1.json
  def update
    respond_to do |format|
      if @specific_gravity.update(specific_gravity_params)
        format.html { redirect_to @batch, notice: 'Specific gravity was successfully updated.' }
        format.json { render :show, status: :ok, location: @specific_gravity }
      else
        format.html { render :edit }
        format.json { render json: @specific_gravity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specific_gravities/1
  # DELETE /specific_gravities/1.json
  def destroy
    @specific_gravity.destroy
    respond_to do |format|
      format.html { redirect_to @batch, notice: 'Specific gravity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specific_gravity
      @specific_gravity = SpecificGravity.find(params[:id])
    end

    def set_batch 
      @batch = Batch.find(params[:batch_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specific_gravity_params
      params.require(:specific_gravity).permit(:value, :air_temperature, :stage, :batch_id)
    end
end
