class CategorySweeper < ActionController::Caching::Sweeper
  observe Category

  def after_save(category)
    expire_cache(category)
  end

  def after_destroy(category)
    expire_cache(category)
  end

  def expire_cache(category)
    expire_fragment ("categories_content/#{user_signed_in? ? current_user.cache_key : ''}")
  end

end