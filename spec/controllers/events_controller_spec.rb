require 'spec_helper'

describe EventsController do
  describe 'routes' do
    before :each do
      @user = FactoryGirl.create(:user)
    end
    it 'get index event' do
      expect(:get => '/events').to route_to(:action => 'index', :controller => 'events')
    end
    it 'get comments event' do
      expect(:get => "/events/#{@user.id}/comments").to route_to(:action => 'comments', :controller => 'events', :user_id => "#{@user.id}")
    end
    it 'get likes event' do
      expect(:get => "/events/#{@user.id}/likes").to route_to(:action => 'likes', :controller => 'events', :user_id => "#{@user.id}")
    end
    it 'get sign_out event' do
      expect(:get => "/events/#{@user.id}/sign_out").to route_to(:action => 'sign_out', :controller => 'events', :user_id => "#{@user.id}")
    end
    it 'get sign_in event' do
      expect(:get => "/events/#{@user.id}/sign_in").to route_to(:action => 'sign_in', :controller => 'events', :user_id => "#{@user.id}")
    end
    it 'get navigation event' do
      expect(:get => "/events/#{@user.id}/navigation").to route_to(:action => 'navigation', :controller => 'events', :user_id => "#{@user.id}")
    end
  end
  describe 'disallow member-only actions when not logged in (guest/unprivileged)' do
    before :each do
      @user = FactoryGirl.create(:user)
    end
    after { response.should redirect_to new_user_session_path }
    it {get :index}
    it {get :comments, :user_id => "#{@user.id}"}
    it {get :likes, :user_id => "#{@user.id}"}
    it {get :sign_out, :user_id => "#{@user.id}"}
    it {get :sign_in, :user_id => "#{@user.id}"}
    it {get :navigation, :user_id => "#{@user.id}"}
  end
  describe 'events' do
    before :each do
      @user = FactoryGirl.create(:user)
      @navigation = FactoryGirl.create(:navigation)
      category = FactoryGirl.create(:category)
      image = FactoryGirl.create(:image, :category_id => category.id)
      @comment = FactoryGirl.create(:comment, :image_id => image.id, :user_id => @user.id)
      @like = FactoryGirl.create(:like, :image_id => image.id, :user_id => @user.id)
      @events = []
      @events << FactoryGirl.create(:event, :eventable_type => 'sign_in', :eventable_id => "#{@user.id}", :user => @user)
      @events << FactoryGirl.create(:event, :eventable_type => 'sign_out', :eventable_id => "#{@user.id}", :user => @user)
      @events << FactoryGirl.create(:event, :eventable => @navigation, :user => @user)
      @events << FactoryGirl.create(:event, :eventable => @like, :user => @user)
      @events << FactoryGirl.create(:event, :eventable => @comment, :user => @user)
      sign_in @user
    end
    it 'index' do
      get :index
      assigns(:users).should include(@user)
    end
    it 'comments' do
      get :comments, :user_id => "#{@user.id}"
      assigns(:events).should include(@events[4])
      assigns(:user).should == @user.nickname
    end
    it 'likes' do
      get :likes, :user_id => "#{@user.id}"
      assigns(:events).should include(@events[3])
      assigns(:user).should == @user.nickname
    end
    it 'sign_out' do
      get :sign_out, :user_id => "#{@user.id}"
      assigns(:events).should include(@events[1])
      assigns(:user).should == @user.nickname
    end
    it 'sign_in' do
      get :sign_in, :user_id => "#{@user.id}"
      assigns(:events).should include(@events[0])
      assigns(:user).should == @user.nickname
    end
    it 'navigation' do
      get :navigation, :user_id => "#{@user.id}"
      assigns(:events).should include(@events[2])
      assigns(:user).should == @user.nickname
    end
  end
end