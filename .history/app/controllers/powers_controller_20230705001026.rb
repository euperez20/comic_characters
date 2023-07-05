class PowersController < ApplicationController
    def index
      @powers = Power.all
      @origins = Origin.all
    end

    def show
      @power = Power.find(params[:id])
      @character = @power.characters
    end
  end
  