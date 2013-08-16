class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  cache_sweeper :subscribe_sweeper, :only => [:subscribe]

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
