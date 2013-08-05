require 'spec_helper'

describe CategoriesController do

  describe 'routing' do
    it 'show root' do
      category = FactoryGirl.create(:category)
      expect(:get => "categories/#{category.id}").to route_to(:action => 'show', :controller => 'categories', :id=>"#{category.id}")
    end
    it 'subscribe root' do
      expect(:post => 'categories/subscribe').to route_to(:action => 'subscribe', :controller =>'categories')
    end
  end

  describe 'disallow member-only actions when not logged in (guest/unprivileged)' do
    before do
      @category = FactoryGirl.create(:category)
      @user = FactoryGirl.create(:user)
    end
    after { response.should redirect_to new_user_session_path }
    it { post :subscribe, :subscribe => {:category => @category, :user => @user} }
  end
  describe 'SHOW category' do
    before do
      @images = []
      @category = FactoryGirl.create(:category)
      6.times do
        @images << FactoryGirl.create(:image, :category => @category)
      end
      get :show, :id => @category.id
    end
    it 'should assign category' do
      assigns(:category).should_not be_nil
      assigns(:category).should == @category
    end
    it 'test images select order paginate' do
      assigns(:images).should_not be_nil
      @images.delete_at(0)
      assigns(:images).should == @images.reverse
    end
  end
  describe 'subscribe category' do
    before do
      @category = FactoryGirl.create(:category)
      @category2 = FactoryGirl.create(:category)
      user = FactoryGirl.create(:user)
      sign_in user
    end
    it 'subscribed\unsubscribed' do
      expect {
        post :subscribe, :id => @category.id
        post :subscribe, :id => @category2.id
      }.to change(Subscribe, :count).by(2)
      expect {
        post :subscribe, :id => @category.id
      }.to change(Subscribe, :count).by(-1)
    end
    it 'json data test subscribe' do
      post :subscribe, :id => @category.id
      body = JSON.parse(response.body)
      body['id'].should == @category.id
      body['status'].should == true
    end
    it 'json data test unsubscribe' do
      post :subscribe, :id => @category.id #subscribed
      post :subscribe, :id => @category.id #usubscribed
      body = JSON.parse(response.body)
      body['id'].should == @category.id
      body['status'].should == false
    end
  end
end