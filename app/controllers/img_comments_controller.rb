class ImgCommentsController < ApplicationController
  before_filter :authenticate_user!, :except => []

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.img_comments.build(params[:img_comment].merge(:user => current_user))
    @comment.save
    redirect_to "/img_categories/#{@image.img_category.id}/images/#{@image.id}"
  end
end