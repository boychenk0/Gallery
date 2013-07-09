class ImagesController < ApplicationController
  def index
    @images = Image.order('created_at DESC').page(params[:page]).per(5)
  end
  def show
    @image = Image.find(params[:id])
    @comments = @image.img_comments
    @comment = @image.img_comments.build
  end
end
