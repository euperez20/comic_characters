class PowersController < ApplicationController
    def index
      @powers = Power.all
      @origins = Origin.all
    end

    def show
      @power = Power.find(params[:id])
      @characters = @power.characters
      @origins = Origin.all
    end
  end
  