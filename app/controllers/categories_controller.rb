class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]


  def index
    session[:return_to] = request.fullpath
    #@categories = Category.category_sort_by_images_count.includes(:images => [:category]).page(params[:page]).per(5)
    #@images = Image.includes(:category).order('created_at DESC').page(params[:page]).per(5)
    #@likes = Like.last_likes.includes(:user, :image => [:category])
    #@comments = Comment.last_comments.includes(:user, :image=> [:category])
  end

  def show
    session[:return_to] = request.fullpath
    @category = Category.find(params[:id])
    @images = @category.images.includes(:category).order('created_at DESC').page(params[:page]).per(10)
  end

end
