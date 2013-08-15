class CommentSweeper < ActionController::Caching::Sweeper
  observe Comment

  def after_save(comment)
    expire_cache(comment)
  end

  def after_destroy(comment)
    expire_cache(comment)
  end

  def expire_cache(comment)
    expire_fragment("images_list/#{comment.image.category.cache_key}")
    expire_fragment("images_list/all_images")
  end

end