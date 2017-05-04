class WelcomeController < ApplicationController
  def index
  end

  def construction
    render layout: "full"
  end
end