class ImageSweeper < ActionController::Caching::Sweeper
  observe Image


  def after_save(image)
    expire_cache(image)
  end

  def after_destroy(image)
    expire_cache(image)
  end

  def expire_cache(image)
    expire_fragment("images_list/#{image.category.cache_key}")
    expire_fragment("images_list/all_images")
  end

end