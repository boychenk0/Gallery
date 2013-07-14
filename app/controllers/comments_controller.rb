class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.build(params[:comment].merge(:user => current_user))
    @comment.save
    redirect_to "/categories/#{@image.category.id}/images/#{@image.id}"
  end
end