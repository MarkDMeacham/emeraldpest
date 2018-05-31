class BlogsController < ApplicationController
  before_filter :authenticate, except: [:index, :search, :show]
  layout :get_layout

  def index
    @blogs = Blog.search(params)
  end

  def search
    @blogs = Blog.search(params)
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
      render 'edit'
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
      render 'show'
      return
    end
    redirect_to blogs_path, flash: {notice: "Blog destroyed"}
  end

  private
  def instantiate
    @blog = Blog.find params[:id]
  end

  def new_params
    params.require(:blog).permit(:title, :text, :tags)
  end

  def create_params
    params.require(:blog).permit(:title, :text, :tags).merge(creator_id: current_user.id, updator_id: current_user.id)
  end

  def update_params
    params.require(:blog).permit(:title, :text, :tags).merge(updator_id: current_user.id)
  end
end
