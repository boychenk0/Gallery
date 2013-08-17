require 'spec_helper'

describe SubscribeMailer do
  describe 'new_image' do
    before do
      @user1 = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
      @category1 = FactoryGirl.create(:category)
      FactoryGirl.create(:subscribe, :category => @category1, :user => @user1)
      FactoryGirl.create(:subscribe, :category => @category1, :user => @user2)
      image = FactoryGirl.create(:image, :category => @category1)
      @mail = SubscribeMailer.new_image(image.category.users, @category1, image)
    end

    it 'renders the subject' do
      @mail.subject.should == "New image in the category of #{@category1.name}"
    end

    #ensure that the receiver is correct
    it 'renders the receiver email' do
      @mail.to.should == [@user1.email, @user2.email]
    end

    #ensure that the sender is correct
    it 'renders the sender email' do
      @mail.from.should == ['emailfaceit@gmail.com']
    end
  end
end