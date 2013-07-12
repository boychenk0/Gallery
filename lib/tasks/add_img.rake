require 'io/console'

desc 'Uploading files from this folder'
task :upload_img => :environment do
  get_path = Dir.new(STDIN.gets.chomp)
  upload_file_and_create_categories(get_path, category = nil)
end


def upload_file_and_create_categories(dir, cat)
  dir.entries.each do |e|
    file_or_dir = File.join(dir.path, e)
    if File.directory?(file_or_dir) && file_or_dir != File.join(dir.path, '.') && file_or_dir != File.join(dir.path, '..')
      category = ImgCategory.find_or_create_by_name(e)
      dir = Dir.new(file_or_dir)
      upload_file_and_create_categories(dir, category)
    elsif File.file?(file_or_dir) && !cat.nil? && ['.jpg', '.jpeg', '.png'].include?(File.extname(file_or_dir))
      cat.images.create(:url => File.open(file_or_dir))
    end
  end
end