ActiveAdmin.register Image do
  action_item do
    link_to "Parse", admin_images_parse_path
  end
  index do
      selectable_column
      column :id
      column "View" do |img|
        image_tag(img.url, :size => '128x128')
      end
      column 'Url' do |img|
        div :class => 'url' do
          img.url
        end
      end
      column 'likes', :sortable => :likes do |img|
        div :class => 'likecount' do
          img.likes_count
        end
      end
      column 'comments', :sortable => :comments do |img|
        div :class => 'comcount' do
          img.comments_count
        end
      end
      column :created_at
      column :updated_at
      default_actions
  end

  controller do
    cache_sweeper :image_sweeper, :only => [:create_parse_image]

    #get
    def index
      params[:order] = 'likes_count_desc'
      super
    end

    #get
    def parse
    end

    #post
    def parse_images
      #page_action :parse_images, :method => :post do
      @images = []
      @categories = Category.all
      curl =  Curl.get(params[:image][:url]) do |http|
      end
      curl = Nokogiri::HTML(curl.body_str)
      curl.css('img').each do |img|
        @images << img['src']
      end
      render :layout => 'active_admin'
    end
    #post
    def create_parse_image
      #page_action :create_image, :method => :post do
      src = params[:src]
      category = Category.find(params[:category])
      parent = params[:parent]
      curl =  Curl.get(params[:src])
      tempfile=Tempfile.new(Time.now.to_f.to_s)
      tempfile.write curl.body_str.force_encoding('utf-8')
      uploaded_file = ActionDispatch::Http::UploadedFile.new(:tempfile => tempfile, :filename => params[:src].split("/").last)
      logger.info uploaded_file
      @img = category.images.create!(:url=>uploaded_file)
      render :json => {:src=>src, :category=>category, :parent => parent}, layout: false

    end
  end
end