path_to_images = "#{Rails.root}/db/data_seed"

AdminUser.create(:email => 'admin@example.com')

User.create(:nickname => 'Test User', :email => 'user@example.com', :password => '123123123', :avatar => File.open("#{path_to_images}/avatar.jpg"))

Category.create(:name => 'abstractions')
Category.create(:name => 'christmas')
Category.create(:name => 'girls')
Category.create(:name => 'nature')
Category.create(:name => 'animals')
Category.create(:name => 'auto')
Category.create(:name => 'business')

catabstr = Category.find_by_name('abstractions')
5.times do |i|
  Image.create(:url => File.open("#{path_to_images}/a#{i}.jpg"), :category => catabstr)
end
catchrist = Category.find_by_name('christmas')
10.times do |i|
  Image.create(:url => File.open("#{path_to_images}/c#{i}.jpg"), :category => catchrist)
end
catnature = Category.find_by_name('nature')
5.times do |i|
  Image.create(:url => File.open("#{path_to_images}/n#{i}.jpg"), :category => catnature)
end
catanimal = Category.find_by_name('animals')
Image.create(:url => File.open("#{path_to_images}/animal1.jpg"), :category => catanimal)
catauto = Category.find_by_name('auto')
Image.create(:url => File.open("#{path_to_images}/auto1.jpg"), :category => catauto)
catbuss = Category.find_by_name('business')
Image.create(:url => File.open("#{path_to_images}/buss1.jpg"), :category => catbuss)
catgirls = Category.find_by_name('girls')
10.times do |i|
  Image.create(:url => File.open("#{path_to_images}/#{i}.jpg"), :category => catgirls)
end
image_for_comments = Image.last
user_for_comments_and_likes = User.last
5.times{|i|
  Comment.create(:image => image_for_comments, :user => user_for_comments_and_likes, :body => "TestComment#{i}")
}
images_for_likes = Image.last(5)
images_for_likes.each do |img|
  Like.create(:image_id => img.id, :user_id => user_for_comments_and_likes.id)
end
