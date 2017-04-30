class QuotesController < ApplicationController
  def new
    logger.debug "let's create a new quote"
  end

  def create
    logger.debug "you created a quote!"
  end
end