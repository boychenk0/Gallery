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
      logger.info http.body_str
    end
    curl = Nokogiri::HTML(curl.body_str)
    curl.css('img').each do |img|
      @images << img['src']
      logger.info img['src']
    end

    #tempfile=Tempfile.new(Time.now.to_f.to_s)
    #tempfile.write curl.body_str.force_encoding('utf-8')
    #uploaded_file = ActionDispatch::Http::UploadedFile.new(:tempfile => tempfile, :filename => params[:file_addr].split("/").last)
    #@pic = Picture.create!(:title=>params[:file_addr],:filename=>uploaded_file)
    #@pic.categories = Category.where(:name => params[:categories])
    #render :json => images
    render :layout => 'active_admin'
  end

  page_action :create_image, :method => :post do
     logger.info '123123'*30
     render :json => {:ok=>'okay'}, layout: false
  end

end