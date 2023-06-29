class OriginsController < ApplicationController
  before_action :set_origin, only: %i[ show edit update destroy ]

  # GET /origins or /origins.json
  def index
    @origins = Origin.all
  end

  # GET /origins/1 or /origins/1.json
  def show
    @origin = Origin.find(params[:id])
    @characters = Character.where(origin: @origin)
  end

#


  # GET /origins/new
  def new
    @origin = Origin.new
  end

  # GET /origins/1/edit
  def edit
  end

  # POST /origins or /origins.json
  def create
    @origin = Origin.new(origin_params)

    respond_to do |format|
      if @origin.save
        format.html { redirect_to origin_url(@origin), notice: "Origin was successfully created." }
        format.json { render :show, status: :created, location: @origin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @origin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /origins/1 or /origins/1.json
  def update
    respond_to do |format|
      if @origin.update(origin_params)
        format.html { redirect_to origin_url(@origin), notice: "Origin was successfully updated." }
        format.json { render :show, status: :ok, location: @origin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @origin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /origins/1 or /origins/1.json
  def destroy
    @origin.destroy

    respond_to do |format|
      format.html { redirect_to origins_url, notice: "Origin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_origin
      @origin = Origin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def origin_params
      params.require(:origin).permit(:origin)
    end
end
