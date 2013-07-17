class EventsController < ApplicationController
  def index
    @users = User.order('created_at DESC').page(params[:page]).per(10)
  end

  #def show
  #  @events = Event.where(:eventable_type => 'Navigation')#find_by_user_id(params[:user_id])
  #end
  def navigation
    @events = Event.where(:eventable_type => 'Navigation', :user_id =>params[:user_id]).preload(:eventable).order('created_at DESC').page(params[:page]).per(10)

    #logger.info @events.inspect
    @user = User.find(params[:user_id]).nickname
  end
  def sign_in

  end
  def sign_out

  end
  def likes
    @events = Event.where(:eventable_type => 'Like', :user_id =>params[:user_id]).preload(:eventable).order('created_at DESC').page(params[:page]).per(10)

    #logger.info @events.inspect
    @user = User.find(params[:user_id]).nickname
  end
  def comments

  end
end
