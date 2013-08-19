class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  cache_sweeper :subscribe_sweeper, :only => [:subscribe]

  def index
    @categories = Category.category_sort_by_images_count.includes(:users).page(params[:page]).per(5)
    @images = Image.includes(:category).order('created_at DESC').page(params[:page]).per(5)
    @likes = Like.last_likes.page(params[:page]).per(5)
    @comments = Comment.last_comments.page(params[:page]).per(5)
  end

  def show
    session[:return_to] = request.fullpath
    @category = Category.find(params[:id])
    @images = @category.images.includes(:category).order('created_at DESC').page(params[:page]).per(5)
  end

  #subscribe
  def subscribe
    category = Category.find(params[:id])
    if (@s = Subscribe.where(:category_id=>category.id, :user_id=>current_user.id)).blank?
      current_user.subscribes.create(:category=>category)
      status = true
    else
      @s.destroy_all
      status = false
    end
    render :json=>{:status=>status, :id=>category.id}, layout: false
  end
end
