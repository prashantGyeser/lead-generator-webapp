class Dashboard::LeadsController < Dashboard::ApplicationController
  def index

    current_user_tokens = Token.where(user_id: current_user.id)

    if current_user_tokens.count > 0

    else
      session[:user_id] = current_user.id
      @application_not_authorized = true
    end


  end
end
