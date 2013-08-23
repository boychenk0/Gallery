class SubscribesController < ApplicationController
  cache_sweeper :subscribe_sweeper, :only => [:subscribe]
  before_filter :authenticate_user!, :only => [:create]

  def create
    logger.info 'aaa'*30
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