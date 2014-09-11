require 'setup_status'

class Dashboard::ReportsController < Dashboard::ApplicationController
  def index

    if current_user.setup_complete != true
      redirect_to dashboard_initial_setups_index_path
    else
    end
  end
end
