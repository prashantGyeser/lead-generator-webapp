require 'setup_status'

class Dashboard::ReportsController < Dashboard::ApplicationController
  def index

    if current_user.setup_complete != true
      redirect_to dashboard_initial_setups_index_path
    else

      @your_int = 123
      @leads_count = [ [1, 30],
                      [2, 20],
                      [3, 10],
                      [4, 30],
                      [5,15],
                      [6, 25],
                      [7, 40]

      ]
      @tweets_count = [
          [1, 30],
          [2, 30],
          [3, 20],
          [4, 400],
          [5, 30],
          [6, 45],
          [7, 50],
      ]
      gon.leads_count = @leads_count
      gon.tweets_count = @tweets_count


    end
  end
end
