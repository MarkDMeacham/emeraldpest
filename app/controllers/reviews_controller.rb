class ReviewsController < ApplicationController
  before_filter :authenticate
  before_filter :instantiate, only: [:edit, :update, :destroy]
  layout :get_layout

  def index
    @reviews = Review.reorder(id: :desc)
  end

  def search
    query = Review.reorder(id: :desc)

    if params[:term]
      term = "%#{params[:term].to_s.as_search_param}"
      query = query.where("name LIKE :term OR text LIKE :term", term: term)
    end

    @reviews = query
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(create_params)

    unless @review.valid?
      render 'new'
      return
    end

    redirect_to reviews_path
  end

  def edit
  end

  def update
    @review.update_attributes(update_params)

    unless @review.valid?
      render 'edit'
      return
    end

    redirect_to reviews_path
  end

  def destroy
    @review.destroy

    unless @review.valid?
      render 'edit'
      return
    end

    redirect_to reviews_path
  end

  private 
  def instantiate
    @review = Review.find params[:id]
  end

  def create_params
    params.require(:review).permit(:name, :text).merge(creator_id: current_user.id, updator_id: current_user.id)
  end

  def update_params
    params.require(:review).permit(:name, :text).merge(updator_id: current_user.id)
  end
end
