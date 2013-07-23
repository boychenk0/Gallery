class CategorySweeper < ActionController::Caching::Sweeper
  observe Category

end