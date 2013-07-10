require 'io/console'

desc 'Uploading files from this folder'
task :upload_img => :environment do
  path = Dir.new(STDIN.gets.chomp)
  cat = nil
  upload_file_and_create_categories(path, cat)
end


def upload_file_and_create_categories(path, cat)
  path.entries.each do |e|
    file = File.join(path.path, e)
    if File.directory?(file) && file != File.join(path.path, '.') && file != File.join(path.path, '..')
      category = ImgCategory.find_or_create_by_name(e)
      file = Dir.new(file)
      upload_file_and_create_categories(file, category)
    elsif File.file?(file) && !cat.nil?
      cat.images.create(:url => File.open(file))
    end
  end
end