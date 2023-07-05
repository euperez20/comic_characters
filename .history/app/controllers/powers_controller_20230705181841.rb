class PowersController < ApplicationController
    def index
      @powers = Power.all
      @origins = Origin.all
      @powers = @powers.page(params[:page]).per(10)
    end

    def show
      @power = Power.find(params[:id])
      @characters = @power.characters
      @origins = Origin.all
    end
  end
  