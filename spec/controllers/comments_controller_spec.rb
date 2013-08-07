require 'spec_helper'

describe CommentsController do
  describe 'routing' do
    before :each do
      @category = FactoryGirl.create(:category)
      @image = FactoryGirl.create(:image, :category => @category)
      @user = FactoryGirl.create(:user)
      sign_in @user
    end
    it 'create comment rout' do
      expect(:post => "/images/#{@image.id}/comments").to route_to(:action => 'create', :controller => 'comments', :image_id=>"#{@image.id}")
    end
  end
  describe 'disallow member-only actions when not logged in (guest/unprivileged)' do
    before do
      @category = FactoryGirl.create(:category)
      @image = FactoryGirl.create(:image, :category => @category)
      @user = FactoryGirl.create(:user)
    end
    after { response.should redirect_to new_user_session_path }
    it { post :create, {:comment => {:body=>'One Comment!'}, :image_id => @image.id} }
  end
  describe  Comment do
    before :each do
      @category = FactoryGirl.create(:category)
      @image = FactoryGirl.create(:image, :category => @category)
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    it 'has a 200 status code' do
      xhr :post, :create, { :comment => {:body=>'One Comment!'}, :image_id => @image.id}
      response.code.should == "200"
    end
    it 'comment valid' do
      expect{
        post :create, {:comment => {:body=>'One Comment!'}, :image_id => @image.id}
      }.to change(Comment, :count).by(1)
    end
    it 'comment blank' do
      expect{
        post :create, {:comment => {:body=>''}, :image_id => @image.id}
      }.to change(Comment, :count).by(0)
    end
    it 'comment blank json test' do
      xhr :post, :create, {:comment => {:body=>''}, :image_id => @image.id}
      body = JSON.parse(response.body)
      body['errors'].should == {"body"=>["can't be blank"]}
    end
  end
end