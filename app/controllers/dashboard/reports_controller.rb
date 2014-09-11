require 'setup_status'

class Dashboard::ReportsController < Dashboard::ApplicationController
  def index

    if current_user.setup_complete != true
      puts "It isgetting redirected back"
      redirect_to dashboard_initial_setups_index_path
    else
      puts "Woohoo! It is getting to the repoirts controler with: #{SetupStatus.setup_complete?(current_user.id)}"
    end
  end
end
