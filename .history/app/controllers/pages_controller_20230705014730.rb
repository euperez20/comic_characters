class PagesController < ApplicationController
  def about
    @title = "About Us"
    @description = "This is the About page of our application."
  end
end
