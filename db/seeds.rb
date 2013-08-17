path_to_images = "#{Rails.root}/db/data_seed"

AdminUser.create(:email => 'admin@example.com')

User.create(:nickname => 'Test', :email => 'user@example.com', :password => '123123123', :avatar => File.open("#{path_to_images}/avatar.jpg"))

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
catgirls = Category.find_by_name('girls')
10.times do |i|
  Image.create(:url => File.open("#{path_to_images}/#{i}.jpg"), :category => catgirls)
end

