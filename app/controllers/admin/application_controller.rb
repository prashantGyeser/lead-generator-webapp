class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #layout "admin/application"

  before_action :check_admin
  before_action :authenticate_user!
  helper_method :current_user_name
  layout "admin/application"


  def current_user_name
    token = Token.where(user_id: current_user.id).last
    return token.name
  end

  protected

  def check_admin
    if !current_user.try(:admin?)
      redirect_to root_path
    end
  end



end
