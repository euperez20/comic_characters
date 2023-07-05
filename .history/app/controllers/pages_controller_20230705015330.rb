class PagesController < ApplicationController
  def about
    @title = "About Us"
    @description = "This is the About page of the comic application."
    @origins = Origin.all
  end
end
