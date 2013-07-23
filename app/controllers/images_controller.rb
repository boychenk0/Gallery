class ImagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :authf, :index]
  cache_sweeper :image_sweeper, :only => [:like]

  def index
    session[:return_to] = request.fullpath
    @images = Image.order('created_at DESC').page(params[:page]).per(5).preload(:category)
    @categories = Category.category_sort
  end

  def show
    session[:return_to] = request.fullpath
    @image = Image.find(params[:id])
    @comments = @image.comments.order('created_at DESC').where("body != ''").page(params[:page]).per(5).preload(:user)
    @comment = @image.comments.build
    if user_signed_in?
      @status = (Like.where(:image_id => @image.id, :user_id => current_user.id)).blank? ? true : false
    elsif
      @status = true
    end
  end

  #like image
  def like
    like_id = params[:id]
    status = false
    if (@l = Like.where(:image_id => like_id, :user_id => current_user.id)).blank?
      like = current_user.likes.create(:image_id => like_id)
      status = true
      Event.track_event('like', {:like => like, :user => current_user})
    else
      @l.destroy_all
      status = false
    end
    all_likes = Like.where(:image_id =>like_id).size
    render :json => {:all_likes=>all_likes, :status => status}, layout: false
  end

  #subscribe
  def subscribe
    #cat_id = params[:id]
    category = Category.find(params[:id])
    status = false
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
