class Dashboard::LeadsController < Dashboard::ApplicationController
  def index
    if SetupStatus.setup_complete?(current_user.id) == false
      redirect_to dashboard_initial_setups_index_path
    end
  end
end
