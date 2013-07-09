class ImgCategoriesController < ApplicationController
  def index
    @categories = ImgCategory.all
  end

  def show
  end
end
