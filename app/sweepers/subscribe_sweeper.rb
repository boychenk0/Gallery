class SubscribeSweeper < ActionController::Caching::Sweeper
  observe Subscribe

  def after_save(subscribe)
    expire_cache(subscribe)
  end

  def after_destroy(subscribe)
    expire_cache(subscribe)
  end

  def expire_cache(subscribe)
    expire_fragment("categories_content/#{user_signed_in? ? current_user.cache_key : ''}")
  end

end