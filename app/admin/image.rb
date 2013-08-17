ActiveAdmin.register Image do

  action_item do
    link_to 'Parse', admin_parse_path
  end
  filter :category
  filter :url
  index  do
      selectable_column
      column :id, :sortable => true
      column "View" do |img|
        image_tag(img.url, :size => '128x128')
      end
      column 'Url' do |img|
        div :class => 'url' do
          img.url
        end
      end
      column 'category' do |img|
        img.category.name
      end
      column 'likes', :sortable => :likes_count do |img|
        div :class => 'likecount' do
          img.likes_count
        end
      end
      column 'comments', :sortable => :comments_count do |img|
        div :class => 'comcount' do
          img.comments_count
        end
      end
      column "created_at", :sortable => :created_at do |img|
        img.created_at.strftime('%Y-%m-%d, %H:%M') # if the format is different that expected
      end
      default_actions
  end
  show :title => 'Image' do

    render 'admin/images/show'
  end

  form :html => {:enctype => 'multipart/form-data'} do |f|
    f.semantic_errors :base
    f.inputs 'Image Details' do
      f.input :category, :as => :select
      f.input :url, :as => :file, :label => 'Image'#, :hint => file.template.image_tag(file.object.url.url, :width => 200, :height => 200)
    end
    f.actions
  end

  controller do
    cache_sweeper :image_sweeper, :only => [:create, :destroy, :update, :create_parse_image]

    def scoped_collection
      Image.includes(:category)
    end

    #get
    def index
      super
    end

    #post create
    def create
      category = Category.find(params[:image][:category_id])
      category.images.create(:url => params[:image][:url])
      flash[:notice] = 'Images created'
      redirect_to admin_images_path
    end

    def destroy
      super
    end

    def update
      super
    end

    #get
    def parse
    end

    #post
    def parse_images
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