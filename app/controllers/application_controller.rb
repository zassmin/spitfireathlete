class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize_permission, :except => [:new, :create, :show, :index] 

  delegate :allow?, to: :current_permission
  helper_method :allow?

  delegate :allow_param?, to: :current_permission
  helper_method :allow_param?

private

#Authorization
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Please log in!" if current_user.nil?
  end

#Authentication
  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def current_resource
    nil
  end

  def authorize_permission
    if current_permission.allow?(params[:controller], params[:action], current_resource)
      current_permission.permit_params! params
    else
      redirect_to root_url, alert: "Please sign in. <3"
    end
  end
end