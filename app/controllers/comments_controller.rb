class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @image = Image.find(params[:image_id])
    logger.info @image
    @comment = @image.comments.build(params[:comment].merge(:user => current_user))
    logger.info @comment
    @comment.save
    Event.track_event('comments', {:comment => @comment, :user => current_user})

    #Pusher['test-channel'].trigger('test-event',comment: @comment.body.to_json)
  end
end