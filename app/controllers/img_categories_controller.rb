class ImgCategoriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    session[:return_to] = request.fullpath
    @categories = ImgCategory.all
    @images = Image.order('created_at DESC').page(params[:page]).per(5)
  end

  def show
    session[:return_to] = request.fullpath
    @category = ImgCategory.find(params[:id])
    @images = @category.images.order('created_at DESC').page(params[:page]).per(5)
  end
end
