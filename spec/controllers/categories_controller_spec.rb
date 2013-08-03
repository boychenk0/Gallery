require 'spec_helper'

describe CategoriesController do
  describe 'routing' do
    it 'root routes' do
      expect(:get => "/").to route_to(:action => "index", :controller => "images")
    end
    #it 'show' do
    #  expect(:get => 'categories/1').to route_to(:action => 'show', :controller => 'categories')
    #end        q
  end
end

#describe PostsController do
####################################################################################################################################
#  describe "routing" do
#
#    it "routes to #index" do
#      expect(:get => "/posts").to route_to(:action => "index", :controller => "posts")
#    end
#    it "route to #show" do
#      expect(:get => "/posts/1").to route_to(:action => "show", :controller => "posts", :id => "1")
#    end
#    it "route to #new" do
#      expect(:get => "/posts/new").to route_to(:action => "new", :controller => "posts")
#    end
#    it "route to #edit" do
#      expect(:get => "/posts/1/edit").to route_to(:action => "edit", :controller => "posts", :id => "1")
#    end
#    it "route to #destroy" do
#      expect(:delete => "/posts/1").to route_to(:action => "destroy", :controller => "posts", :id => "1")
#    end
#    it "route to #create" do
#      expect(:post => "/posts").to route_to(:action => "create", :controller => "posts")
#    end
#    it "route to #update" do
#      expect(:put => "/posts/1").to route_to(:action => "update", :controller => "posts", :id => "1")
#    end
#  end
####################################################################################################################################
##  describe "disallow member-only actions when not logged in (guest/unprivileged)" do
##    #let(:post){FactoryGirl.create(:post)}
##    after { response.should redirect_to new_user_session_path }
##    it { get :new }
##    it { get :edit, :id => "1" }
##    it { post :create, :post => FactoryGirl.attributes_for(:post) }
##    it { put :update, :id => "1", :post => {'these' => 'params'} }
##    it { delete :destroy, :id => "1" }
##  end
#####################################################################################################################################
##  describe "CRUD" do
##    before do
##      @user = FactoryGirl.create(:user, :email => "asd@ex.com")
##      @post = FactoryGirl.create(:post, :confirmation => true, :user_id => @user.id)
##    end
##    describe "index" do
##      it "should assign posts" do
##        get :index
##        assigns(:posts).should_not be_nil
##      end
##      it "should assign tags" do
##        get :index
##        assigns(:tags).should_not be_nil
##      end
##      it "selection posts" do
##        3.times { |i| FactoryGirl.create(:post, :user => @user) }
##        FactoryGirl.create(:post, :title => "ras dva hidden", :confirmation => true, :user => @user)
##        get :index
##        controller.instance_variable_get(:@posts).count.should == 1
##        response.should render_template(:index)
##      end
##    end
##    ###################################################################################################################################
##    describe "show" do
##      it "should assign posts" do
##        get :show, :id => @post.id
##        assigns(:post).should_not be_nil
##      end
##      it "should assign tags" do
##        get :show, :id => @post.id
##        assigns(:tags).should_not be_nil
##      end
##      it "should assign comments" do
##        get :show, :id => @post.id
##        assigns(:comments).should_not be_nil
##      end
##    end
##    ###################################################################################################################################
##    describe "new" do
##      it "should assign post" do
##        get :new
##        assigns(:post).should be_nil
##      end
##    end
##    ###################################################################################################################################
##    describe "edit" do
##      it "should assign posts" do
##        get :edit, :id => @post.id
##        assigns(:post).should be_nil
##      end
##    end
##    ###################################################################################################################################
##    describe "create" do
##      it "should create a new post" do
##        expect {
##          FactoryGirl.create(:post, :user_id => User.last.id)
##        }.to change(Post, :count).by(1)
##      end
##      it "redirects to post_path where create is successfull" do
##        sign_in @user
##        post :create, :post => FactoryGirl.attributes_for(:post)
##        @post_last = Post.last
##        response.should redirect_to @post_last
##      end
##      it "redirects to post_path where not create" do
##        sign_in @user
##        post :create, :post => FactoryGirl.attributes_for(:post, :title => "")
##        response.should render_template("new")
##      end
##    end
##    ###################################################################################################################################
##    describe "update" do
##      it "update post test" do
##        sign_in @user
##        put :update, :id => @post, :post => {:title => "new title"}
##        Post.last.title.should eq("new title")
##      end
##      it "redirects to post_path where update is successfull" do
##        sign_in @user
##        put :update, :id => @post, :post => {:title => "new title"}
##        response.should redirect_to post_path
##      end
##      it "render action edit where post not save" do
##        sign_in @user
##        put :update, :id => @post, :post => {:title => ""}
##        response.should render_template("edit")
##      end
##    end
##
##    ###################################################################################################################################
##    describe "delete" do
##      it "should delete post" do
##        expect {
##          delete :destroy, :id => @post
##        }.to_not change(Post, :count)
##      end
##      it "redirects to profile_show_path" do
##        sign_in @user
##        puts Post.all.count
##        delete :destroy, :id => @post.id
##        response.should redirect_to profile_show_path
##      end
##    end
##  end
#end