require 'spec_helper'

describe ImagesController do
  describe 'routes' do
    it 'root path' do
      expect(:get => '/').to route_to(:action => 'index', :controller => 'images')
    end
    it 'index' do
      expect(:get => '/images').to route_to(:action => 'index', :controller => 'images')
    end
    it 'show' do
      category = FactoryGirl.create(:category)
      image = FactoryGirl.create(:image, :category => category)
      expect(:get => "/categories/#{category.id}/images/#{image.id}").to route_to(:action => 'show', :controller => 'images', :category_id=>"#{category.id}", :id => "#{image.id}")
    end
    it 'images like create' do
      expect(:post => 'images/like').to route_to(:action => 'like', :controller => 'images')
    end
  end
  describe 'disallow member-only actions when not logged in (guest/unprivileged)' do
    before do
      category = FactoryGirl.create(:category)
      @image = FactoryGirl.create(:image, :category => category)
      @user = FactoryGirl.create(:user)
    end
    after { response.should redirect_to new_user_session_path }
    it { post :like, :like => {:image_id => @image, :user => @user} }
  end
  describe 'images action' do
    before :each do
      @categories = []
      @images = []
      @comments = []
      @user = FactoryGirl.create(:user)
      sign_in @user
      5.times do
        @categories << FactoryGirl.create(:category)
      end
      25.times do
        @images << FactoryGirl.create(:image, :category => @categories[Random.rand(@categories.count)])
      end
      20.times do
        @comments << FactoryGirl.create(:comment, :user_id => @user.id, :image_id => @images[Random.rand(@images.count)].id)
      end
      @categories.each do |c|
        c.reload
      end
      @images.each do |i|
        i.reload
      end

    end
    it 'index' do
      get :index
      assigns(:images).should == @images.reverse[0..4]
      #assigns(:categories).should == Category.category_sort_by_images_count
    end
    it 'show' do
      image = @images[Random.rand(25)]
      comments = image.comments
      get :show, :category_id => image.category.id, :id => image.id
      assigns(:image).should == image
      assigns(:comments).should == comments.sort{|x,y| y<=>x}
      assigns(:comment).should_not be_nil
      assigns(:status).should == true
    end
    it 'action show status like false' do
      post :like, :id => @images[0].id
      image = @images[0]
      comments = image.comments
      get :show, :category_id => image.category.id, :id => image.id
      assigns(:image).should == image
      assigns(:comments).should == comments.sort{|x,y| y<=>x}
      assigns(:comment).should_not be_nil
      assigns(:status).should == false
    end

    it 'action like' do
      expect{
        post :like, :id => @images[Random.rand(25)].id
        post :like, :id => @images[0].id
      }.to change(Like, :count).by(2)
      expect{
        post :like, :id => @images[0].id
      }.to change(Like, :count).by(-1)
    end
    it 'json data test like' do
      post :like, :id => @images[0].id
      body = JSON.parse(response.body)
      body['all_likes'].should == Like.all.count
      body['status'].should == true
    end
  end
end
