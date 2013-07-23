class ImageSweeper < ActionController::Caching::Sweeper
  observe Image

  def after_create(image)
    expire_fragment 'categories'
  end

end