class EventsController < ApplicationController
  def index
    @users = User.order('created_at DESC').page(params[:page]).per(10)
  end

  def navigation
    @events = Event.where(:eventable_type => 'Navigation', :user_id =>params[:user_id]).preload(:eventable).order('created_at DESC').page(params[:page]).per(10)
    @user = User.find(params[:user_id]).nickname
  end

  def sign_in
    @events = Event.where(:eventable_type => 'sign_in', :user_id =>params[:user_id]).order('created_at DESC').page(params[:page]).per(10)
    @user = User.find(params[:user_id]).nickname
  end

  def sign_out
    @events = Event.where(:eventable_type => 'sign_out', :user_id =>params[:user_id]).order('created_at DESC').page(params[:page]).per(10)
    @user = User.find(params[:user_id]).nickname
  end

  def likes
    @events = Event.where(:eventable_type => 'Like', :user_id =>params[:user_id]).preload(:eventable).order('created_at DESC').page(params[:page]).per(10)
    @user = User.find(params[:user_id]).nickname
  end

  def comments
    @events = Event.where(:eventable_type => 'Comment', :user_id =>params[:user_id]).preload(:eventable).order('created_at DESC').page(params[:page]).per(10)
    @user = User.find(params[:user_id]).nickname
  end
end
