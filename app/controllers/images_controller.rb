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

end
