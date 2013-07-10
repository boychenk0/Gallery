class ImgCategoriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @categories = ImgCategory.all
  end

  def show
    @category = ImgCategory.find(params[:id])
    @images = @category.images.order('created_at DESC').page(params[:page]).per(5)
  end
end
