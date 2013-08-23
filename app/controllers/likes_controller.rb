class LikesController < ApplicationController

  def create
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
