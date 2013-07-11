class ImagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :authf]

  def index
    @images = Image.order('created_at DESC').page(params[:page]).per(5)
  end
  def show
    session[:return_to] = request.fullpath
    @image = Image.find(params[:id])
    @comments = @image.img_comments.where("body != ''")
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

  #like image
  def like
    like_id = params[:id]
    status = false
    logger.info(like_id)
    logger.info(current_user.id)
    if (@l = Like.where(:image_id => like_id, :user_id => current_user.id)).blank?
      logger.info 'nil '*30
      logger.info @l.inspect
      current_user.likes.create(:image_id => like_id)
      status = true
    else
      logger.info 'find '*30
      logger.info @l.inspect
      @l.destroy_all
      status = false
    end
    #status =current_user.likes.where(picture_id: params[:pic_id])
    #if params[:check]
    #  json=status.blank? ? 0.3 : 1
    #else
    #  if status.blank?
    #    Like.create(:user_id=>current_user.id,:picture_id=>params[:pic_id])
    #    json=1
    #  else
    #    Like.where("user_id = ? AND picture_id= ?",current_user.id,params[:pic_id]).delete_all
    #    json=0.3
    #  end
    #end
    all_likes = Like.where(:image_id =>like_id).size
    render :json => {:all_likes=>all_likes, :status => status}, layout: false
  end

  #authorization facebook
  def authf
    auth = (env['omniauth.auth'])
    @user = User.find_or_create_by_uid(:uid => auth[:uid], :provider => auth[:provider],
                                        :nickname => auth[:extra][:raw_info][:name], :password =>  Devise.friendly_token[0,20],
                                        :email => "#{auth[:provider]}@#{auth[:extra][:raw_info][:name].delete ' '}.com")
    sign_in @user
    redirect_to session[:return_to]
  end
end
