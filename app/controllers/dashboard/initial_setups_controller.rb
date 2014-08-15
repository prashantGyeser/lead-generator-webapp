class Dashboard::InitialSetupsController < Dashboard::ApplicationController
  def index
    session[:user_id] = current_user.id
  end
end
