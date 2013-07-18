ActiveAdmin.register_page "Parsing" do

  content do
    semantic_form_for :image, :builder => ActiveAdmin::FormBuilder do |f|
      f.inputs 'Upload image:' do
        f.input :url
      end
      f.buttons
    end
  end

  page_action :parse_images, :method => :post do
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

  page_action :create_image, :method => :post do
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