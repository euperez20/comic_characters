class PublishersController < ApplicationController
  before_action :set_publisher, only: %i[ show edit update destroy ]

  # GET publishers 
  def index
    @publishers = Publisher.all
    @origins = Origin.all
    @publishers = @publishers.page(params[:page]).per(10)
  end

  # GET publishers
  def show
    @publisher = Publisher.find(params[:id])
    @characters = @publisher.characters
  end

  # GET New
  def new
    @publisher = Publisher.new
  end

  # GET Edit
  def edit
  end

  # POST Create
  def create
    @publisher = Publisher.new(publisher_params)

    respond_to do |format|
      if @publisher.save
        format.html { redirect_to publisher_url(@publisher), notice: "Publisher was successfully created." }
        format.json { render :show, status: :created, location: @publisher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # Update
  def update
    respond_to do |format|
      if @publisher.update(publisher_params)
        format.html { redirect_to publisher_url(@publisher), notice: "Publisher was successfully updated." }
        format.json { render :show, status: :ok, location: @publisher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # Delete
  def destroy
    @publisher.destroy

    respond_to do |format|
      format.html { redirect_to publishers_url, notice: "Publisher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    
    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

    
    def publisher_params
      params.require(:publisher).permit(:name, :api_detail_url)
    end
end
