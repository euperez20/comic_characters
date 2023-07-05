class CharactersController < ApplicationController
  before_action :set_character, only: %i[ show edit update destroy ]

  # GET /characters or /characters.json
  def index
    @characters = Character.includes(:origin, :publisher)
    @characters = @characters.where(origin_id: params[:origin_id]) if params[:origin_id].present?
    @origins = Origin.all
    @characters = @characters.where(publisher_id: params[:publisher_id]) if params[:publisher_id].present?

  if params[:search].present?
    keyword = params[:search].downcase
    @characters = @characters.where("lower(name) LIKE ?", "%#{keyword}%")
  end
  

  @characters = @characters.page(params[:page]).per(10)

  end

  # GET /characters/1 or /characters/1.json
  def show
    @character = Character.find(params[:id])
    @characters = Character.includes(:origin, :publisher)
    @characters = @characters.where(origin_id: params[:origin_id]) if params[:origin_id].present?
    @origins = Origin.all
    @characters = Character.page(params[:page]).per(10)

    if params[:search].present?
      keyword = params[:search].downcase
      @characters = @characters.where("lower(name) LIKE ?", "%#{keyword}%")
    end

    if params[:origin_id].present?
      origin_id = params[:origin_id]
      @characters = @characters.where(origin_id: origin_id)
    end
    
  end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters or /characters.json
  def create
    @character = Character.new(character_params)

    respond_to do |format|
      if @character.save
        format.html { redirect_to character_url(@character), notice: "Character was successfully created." }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1 or /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to character_url(@character), notice: "Character was successfully updated." }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1 or /characters/1.json
  def destroy
    @character.destroy

    respond_to do |format|
      format.html { redirect_to characters_url, notice: "Character was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit(:name, :api_detail_url, :count_of_issue_appearances, :deck, :description, :string, :gender, :image, :origin, :publisher, :real_name, :power)
    end

    def by_publisher
      @publisher = Publisher.find(params[:id])
      @characters = @publisher.characters
    end

    def by_power
      @power = Power.find(params[:power_id])
      @characters = @power.characters
    end

    def index_by_power
      @power = Power.find(params[:id])
      @characters = @power.characters
    end
    

    
end
