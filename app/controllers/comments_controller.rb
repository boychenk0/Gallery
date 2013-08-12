class CommentsController < ImagesController
  before_filter :authenticate_user!

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.build(params[:comment].merge(:user => current_user))
    @comments = @image.comments.order('created_at DESC').where("body != ''").page(params[:page]).preload(:user)
    respond_to do |format|
      if @comment.save
        Event.track_event('comments', {:comment => @comment, :user => current_user})
        format.js
      else
        format.json {render :json => {:errors => @comment.errors.messages}}
      end
    end
  end
end

