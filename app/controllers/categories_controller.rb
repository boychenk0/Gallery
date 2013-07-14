class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    session[:return_to] = request.fullpath
    @categories = Category.all
    @images = Image.order('created_at DESC').page(params[:page]).per(5)
  end

  def show
    session[:return_to] = request.fullpath
    @categories = Category.all
    @category = Category.find(params[:id])
    @images = @category.images.order('created_at DESC').page(params[:page]).per(5)
  end
end
