class ImagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  def index
    @images = Image.order('created_at DESC').page(params[:page]).per(5)
  end
  def show
    @image = Image.find(params[:id])
    @comments = @image.img_comments
    @comment = @image.img_comments.build

    #page_action :create_image, :method => :post do
    #  curl =  Curl.get(params[:file_addr])
    #  tempfile=Tempfile.new(Time.now.to_f.to_s)
    #  tempfile.write curl.body_str.force_encoding('utf-8')
    #  uploaded_file = ActionDispatch::Http::UploadedFile.new(:tempfile => tempfile, :filename => params[:file_addr].split("/").last)
    #  @pic = Picture.create!(:title=>params[:file_addr],:filename=>uploaded_file)
    #  @pic.categories = Category.where(:name => params[:categories])
    #  render :json => {}
    #end
  end
end
