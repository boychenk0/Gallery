class Image < ActiveRecord::Base
  attr_accessible :comment_count, :likes, :url, :_category_id
end
