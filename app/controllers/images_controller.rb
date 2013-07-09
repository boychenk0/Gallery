class ImagesController < ApplicationController
  def index
    @images = Image.order('created_at DESC').page(params[:page]).per(10)
  end
  def show
    #@image = Image.find(params[:id])
  end
end
