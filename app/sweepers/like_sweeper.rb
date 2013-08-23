class LikeSweeper < ActionController::Caching::Sweeper
  observe Like

  def after_save(like)
    expire_cache(like)
  end

  def after_destroy(like)
    expire_cache(like)
  end

  def expire_cache(like)
    #expire_fragment("images_list/#{like.image.category.cache_key}")
    #expire_fragment("images_list/all_images")
    expire_fragment("last_likes")
  end

end