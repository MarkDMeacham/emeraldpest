class WelcomeController < ApplicationController
  def index
    @reviews = Review.all
  end

  def construction
    render layout: "full"
  end
end