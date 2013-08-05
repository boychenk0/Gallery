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
    it 'comment validate' do
      expect{
      #get "categories/#{@category.id}/images/#{@image.id}"
      post :create, {:comment => {:body=>'One Comment!'}, :image_id => @image.id }
      }.to change(Comment, :count).by(1)
    end
  end

end
#respond_to do |format|
#  if @comment.save
#    format.json { render :json => {:author => @comment.commentable.name ,:comment => @comment.body, :image => image, :date => @comment.created_at.strftime('%d %B %Y %H:%M')} }
#  else
#    format.json { render :json => {:errors => @comment.errors.full_messages }}
#  end
#  format.html { redirect_to image_path(@image) }
#end