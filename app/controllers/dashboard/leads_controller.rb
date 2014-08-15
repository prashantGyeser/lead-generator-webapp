class Dashboard::LeadsController < Dashboard::ApplicationController
  def index

    current_user_tokens = Token.where(user_id: current_user.id)

    if current_user_tokens.count > 0

    else
      redirect_to dashboard_initial_setups_index_path
    end


  end
end
