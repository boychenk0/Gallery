require 'spec_helper'

describe MessagesController do
  describe 'route' do
    it 'create' do
      expect(:post => '/messages').to route_to(:action => 'create', :controller => 'messages')
    end
  end
  describe 'disallow member-only actions when not logged in (guest/unprivileged)' do
    before do
      @user = FactoryGirl.create(:user)
    end
    after { response.should redirect_to new_user_session_path }
    it { post :create, :message => {:body => 'OneTwoThree'}, :user => @user }
  end
  describe 'message' do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end
    it 'create message' do
      expect{
        post :create, :message => {:body => 'OneTwoThree'}, :user => @user
      }.to change(Message, :count).by(1)
    end
  end
end