class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @message = current_user.messages.build(params[:message])
    #@comment = @image.comments.build(params[:comment].merge(:user => current_user))
    if @message.save
      Pusher.url = "http://74c9b81466fe7a2eb84e:21002de0cdb237e1d3da@api.pusherapp.com/apps/48385"
      Pusher['test_channel'].trigger('my_event', {message: @message, user: @message.user})
    end
    render :json=>{}
  end
end