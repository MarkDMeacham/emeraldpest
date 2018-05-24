class ReviewsController < ApplicationController
  before_filter :authenticate
  before_filter :instantiate, only: [:edit, :destroy]

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

  private 
  def instantiate
    @review = Review.find params[:id]
  end
end
