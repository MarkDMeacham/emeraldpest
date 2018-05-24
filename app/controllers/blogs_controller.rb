class BlogsController < ApplicationController
  before_filter :authenticate, except: [:index, :show]
  layout :get_layout

  def index
    @blogs = Blog.reorder(id: :desc)
  end

  def search
    term = "%#{params[:term].to_s.as_search_param}"
    query = Blog.reorder(id: :desc)

    if params[:term].present?
      query = query.where("title LIKE :term OR text LIKE :term", term: term)
    end

    @blogs = query
  end

  def new
    @blog = params.has_key?(:blog) ? Blog.new(create_params) : Blog.new
  end

  def create
    @blog = Blog.create(create_params)
    unless @blog.valid?
      render 'new'
      return
    end
    redirect_to blog_path(@blog.slug)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update_attributes(update_params)
    unless @blog.valid?
      redirect_to edit_blog_path(@blog), flash: {alert: @blog.errors.full_messages}
      return
    end
    redirect_to blog_path(@blog.slug)
  end

  def show
    @blog = Blog.find_by_slug(params[:id])
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    unless @blog.valid?
      redirect_to blog_path(@blog.slug)
      return
    end
    redirect_to blogs_path, flash: {notice: "Blog destroyed"}
  end

  private
  def instantiate
    @blog = Blog.find params[:id]
  end

  def get_layout
    current_user ? 'dashboard' : 'application'
  end

  def new_params
    params.require(:blog).permit(:title, :text)
  end

  def create_params
    params.require(:blog).permit(:title, :text).merge(creator_id: current_user.id, updator_id: current_user.id)
  end

  def update_params
    params.require(:blog).permit(:title, :text).merge(updator_id: current_user.id)
  end
end
