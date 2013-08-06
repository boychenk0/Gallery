require 'spec_helper'

describe CommentsController do
  #describe 'routing' do
  #  before :each do
  #    @category = FactoryGirl.create(:category)
  #    @image = FactoryGirl.create(:image, :category => @category)
  #    @user = FactoryGirl.create(:user)
  #    sign_in @user
  #  end
  #  it 'create root' do
  #    expect(:post => "/images/#{@image.id}/comments").to route_to(:action => 'create', :controller => 'comments', :image_id=>"#{@image.id}")
  #  end
  #end
  describe  Comment do
    before :each do
      @category = FactoryGirl.create(:category)
      @image = FactoryGirl.create(:image, :category => @category)
      @user = FactoryGirl.create(:user)
      sign_in @user
    end
    #it 'comment validate' do
    #  #expect{
    #  ##get "categories/#{@category.id}/images/#{@image.id}"
    #  #post :create, {:comment => {:body=>'One Comment!'}, :image_id => @image.id }
    #  #}.to change(Comment, :count).by(1)
    #  post :create, {:comment => {:body=>'One Comment!'}, :image_id => @image.id }
    #  body = JSON.parse(response.body)
    #  puts body
    #  body['id'].should == @category.id
    #  body['status'].should == true
    #end
  end

end