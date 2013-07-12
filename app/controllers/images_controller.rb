require 'curb'
require 'nokogiri'

class ImagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :authf]

  def index
    @images = Image.order('created_at DESC').page(params[:page]).per(5)
  end
  def show
    session[:return_to] = request.fullpath
    @image = Image.find(params[:id])
    @comments = @image.img_comments.where("body != ''")
    @comment = @image.img_comments.build
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
      current_user.likes.create(:image_id => like_id)
      status = true
    else
      @l.destroy_all
      status = false
    end
    all_likes = Like.where(:image_id =>like_id).size
    render :json => {:all_likes=>all_likes, :status => status}, layout: false
  end

  #authorization facebook
  def authf
    auth = (env['omniauth.auth'])
    @user = User.find_or_create_by_uid(:uid => auth[:uid], :provider => auth[:provider],
                                        :nickname => auth[:extra][:raw_info][:name], :password =>  Devise.friendly_token[0,20],
                                        :email => "#{auth[:provider]}@#{auth[:extra][:raw_info][:name].delete ' '}.com")
    sign_in @user
    redirect_to session[:return_to]
  end
end
