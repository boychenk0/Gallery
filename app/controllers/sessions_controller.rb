class SessionsController < Devise::SessionsController

  def create
    super
    if user_signed_in?
      Event.track_event('sessions.create', {:user => current_user})
    end
  end

  def destroy
    user = current_user
    super
    if !user_signed_in?
      Event.track_event('sessions.destroy', {:user => user})
    end
  end

  def authf
    auth = (env['omniauth.auth'])
    @user = User.find_or_create_by_uid(:uid => auth[:uid], :provider => auth[:provider],
                                       :nickname => auth[:extra][:raw_info][:name], :password =>  Devise.friendly_token[0,20],
                                       :email => "#{auth[:provider]}@#{auth[:extra][:raw_info][:name].delete ' '}.com",
                                       :avatar => open(auth[:info][:image].gsub('square', 'large')))
    #@user.update_attributes(:avatar => open(auth[:info][:image].gsub('square', 'large')))
    sign_in @user
    Event.track_event('authf', {:user => @user})
    redirect_to session[:return_to]
  end

end
