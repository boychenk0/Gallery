ActiveAdmin.register User do
  action_item do
    link_to 'Users events', admin_events_path
  end
  filter :nickname
  filter :email
  filter :last_sign_in_at
  filter :last_sign_in_ip
  filter :created_at
  filter :updated_at

  index do
    column :id
    column :nickname
    column :email
    column :last_sign_in_at
    column :last_sign_in_ip
    column :created_at
    column :updated_at
    default_actions
  end
  controller do
    def events
      @search = User.search(params[:q])
      @users= @search.result.order('created_at DESC').page(params[:page]).per(10)
      @page_title='Events by all users'
      render 'admin/events/index'
    end

    def navigation
      @events = Event.where(:eventable_type => 'Navigation', :user_id =>params[:user_id]).preload(:eventable).order('created_at DESC').page(params[:page]).per(10)
      @user = User.find(params[:user_id]).nickname
      @page_title="Navigations by #{@user}"
      render 'admin/events/navigation'
    end

    def sign_in
      @events = Event.where(:eventable_type => 'sign_in', :user_id =>params[:user_id]).order('created_at DESC').page(params[:page]).per(10)
      @user = User.find(params[:user_id]).nickname
      @page_title="Sign_in by #{@user}"
      render 'admin/events/sign_in'
    end

    def sign_out
      @events = Event.where(:eventable_type => 'sign_out', :user_id =>params[:user_id]).order('created_at DESC').page(params[:page]).per(10)
      @user = User.find(params[:user_id]).nickname
      @page_title="Sign_out by #{@user}"
      render 'admin/events/sign_out'
    end

    def likes
      @events = Event.where(:eventable_type => 'Like', :user_id =>params[:user_id]).order('created_at DESC').page(params[:page]).per(10).includes(:eventable => [:image => :category])
      @user = User.find(params[:user_id]).nickname
      @page_title="Likes by #{@user}"
      render 'admin/events/likes'
    end

    def comments

      @events = Event.where(:eventable_type => 'Comment', :user_id =>params[:user_id]).preload(:eventable).order('created_at DESC').page(params[:page]).per(10).includes(:eventable => [:image => :category])
      @user = User.find(params[:user_id]).nickname
      @page_title="Comments by #{@user}"
      render 'admin/events/comments'
    end
  end
end