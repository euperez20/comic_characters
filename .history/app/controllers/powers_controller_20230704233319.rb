class PowersController < ApplicationController
    def index
      @powers = Power.all
      @origins = Origin.all
    end
  end
  