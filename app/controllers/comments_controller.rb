class CommentsController < ImagesController
  before_filter :authenticate_user!

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.build(params[:comment].merge(:user => current_user))
    @comments = @image.comments.order('created_at DESC').where("body != ''").page(params[:page]).preload(:user)
    respond_to do |format|
      if @comment.save
        Event.track_event('comments', {:comment => @comment, :user => current_user})
        format.js{}
      else
        format.json {render :json => {:errors => @comment.errors.messages}}
      end
    end
  end
end
#Pusher.url = "http://74c9b81466fe7a2eb84e:21002de0cdb237e1d3da@api.pusherapp.com/apps/48385"
#Pusher['test_channel'].trigger('my_event', {message: @comment.to_json})
#redirect_to "/categories/#{@image.category.id}/images/#{@image.id}"
#respond_to do |format|
#if @comment.save
#  Event.track_event('comments', {:comment => @comment, :user => current_user})
#  #render_to_string 'comments/comments_show'
#  #format.json { render :json => {:comment => @comment, :user => @comment.user, :date => @comment.created_at.strftime("%Y-%m-%d %H:%M")} }
#
#  format.json { render :json => {:success=>true, :html=>(render text: 'comments_show', :layout => false)} }
#  format.html { }
#else
#  format.json { render :json => {:errors => @comment.errors.full_messages }}
#end
#end

######################################################################################################################################
###  describe "CRUD" do
###    before do
###      @user = FactoryGirl.create(:user, :email => "asd@ex.com")
###      @post = FactoryGirl.create(:post, :confirmation => true, :user_id => @user.id)
###    end
###    describe "index" do
###      it "should assign posts" do
###        get :index
###        assigns(:posts).should_not be_nil
###      end
###      it "should assign tags" do
###        get :index
###        assigns(:tags).should_not be_nil
###      end
###      it "selection posts" do
###        3.times { |i| FactoryGirl.create(:post, :user => @user) }
###        FactoryGirl.create(:post, :title => "ras dva hidden", :confirmation => true, :user => @user)
###        get :index
###        controller.instance_variable_get(:@posts).count.should == 1
###        response.should render_template(:index)
###      end
###    end
###    ###################################################################################################################################
###    describe "create" do
###      it "should create a new post" do
###        expect {
###          FactoryGirl.create(:post, :user_id => User.last.id)
###        }.to change(Post, :count).by(1)
###      end
###      it "redirects to post_path where create is successfull" do
###        sign_in @user
###        post :create, :post => FactoryGirl.attributes_for(:post)
###        @post_last = Post.last
###        response.should redirect_to @post_last
###      end
###      it "redirects to post_path where not create" do
###        sign_in @user
###        post :create, :post => FactoryGirl.attributes_for(:post, :title => "")
###        response.should render_template("new")
###      end
###    end
###    ###################################################################################################################################
###    describe "update" do
###      it "update post test" do
###        sign_in @user
###        put :update, :id => @post, :post => {:title => "new title"}
###        Post.last.title.should eq("new title")
###      end
###      it "redirects to post_path where update is successfull" do
###        sign_in @user
###        put :update, :id => @post, :post => {:title => "new title"}
###        response.should redirect_to post_path
###      end
###      it "render action edit where post not save" do
###        sign_in @user
###        put :update, :id => @post, :post => {:title => ""}
###        response.should render_template("edit")
###      end
###    end
###  end