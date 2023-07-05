class PagesController < ApplicationController
  def about
    @title = "About Us"
    @description = "This is the About page of the comic application."
  end
end
