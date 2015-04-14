class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :after_database_authentication, if: :authenticate_user!


  def after_database_authentication
    if !current_user.admin?
      if current_user.group.nil?
        @user = current_user
        @group = Group.all.sample
        @user.update(:group_id => @group.id)
        Membership.create(user_id: @user.id, group_id: @group.id)
      end
    end
  end


  protected

  def configure_permitted_parameters
	   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :nickname, :email, :password, :password_confirmation, :image_url) } 
  end  


end
