#require 'pusher'
class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @image = Image.find(params[:image_id])
    #logger.info @image
    @comment = @image.comments.build(params[:comment].merge(:user => current_user))
    if @comment.save
        #Pusher.url = "http://74c9b81466fe7a2eb84e:21002de0cdb237e1d3da@api.pusherapp.com/apps/48385"
        #Pusher['test_channel'].trigger('my_event', {message: @comment.to_json})
        Event.track_event('comments', {:comment => @comment, :user => current_user})
    end
    #redirect_to "/categories/#{@image.category.id}/images/#{@image.id}"
  end
end