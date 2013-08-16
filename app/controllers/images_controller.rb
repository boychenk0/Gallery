class ImagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  cache_sweeper :like_sweeper, :only => [:like]

  def index
    session[:return_to] = request.fullpath
    @images = Image.includes(:category).order('created_at DESC').page(params[:page]).per(5)
  end

  def show
    session[:return_to] = request.fullpath
    @image = Image.find(params[:id])
    @comments = @image.comments.order('created_at DESC').where("body != ''").page(params[:page]).per(5).preload(:user)
    @comment = @image.comments.build
    if user_signed_in? && !(Like.where(:image_id => @image.id, :user_id => current_user.id)).blank?
      @status = false
    else
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
      Event.track_event('like', {:like_id => like.id, :user_id => current_user.id})
    else
      @l.destroy_all
      status = false
    end
    all_likes = Like.where(:image_id =>like_id).size
    render :json => {:all_likes=>all_likes, :status => status}, layout: false
  end



end
