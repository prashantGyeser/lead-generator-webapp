class Dashboard::InitialSetupsController < Dashboard::ApplicationController

  layout 'setup/application'

  skip_before_filter :check_setup
  skip_before_filter :trial_expired?

  def index
    @lead_stream = LeadStream.new
    3.times {@lead_stream.keywords.build}
  end

  def create_lead_stream

    @lead_stream = LeadStream.new(lead_stream_params)
    @lead_stream.user_id = current_user.id
    @lead_stream.search_type = "country"

    respond_to do |format|

      if @lead_stream.save
        flash[:success] = "Successfully created your stream"
        format.html { redirect_to dashboard_initial_setups_connect_twitter_path }
      else
        flash[:error] = "Two streams cannot have the same city and category"
        format.html { redirect_to dashboard_root_path }
        format.json { render json: @lead_stream.errors, status: :unprocessable_entity }
      end


    end


  end

  def status

    lead_stream = current_user.lead_streams.last
    @keywords = lead_stream.keywords



    if lead_stream.time_left_for_processing_hours.nil?
      set_time_for_processing(lead_stream)
      @time_remaining = 9
    else
      @time_remaining = get_time_remaining_for_processing(lead_stream)
    end

  end


  def connect_twitter
    session[:user_id] = current_user.id
  end


  private
  def lead_stream_params
    params.require(:lead_stream).permit(:city_name, :name, :country_id, keywords_attributes: [:term])
  end

  def set_time_for_processing(lead_stream)
    lead_stream.time_left_for_processing_hours = 9
    lead_stream.save
  end

  def get_time_remaining_for_processing(lead_stream)
    (((lead_stream.created_at + lead_stream.time_left_for_processing_hours.hours) - Time.now.utc)/ 1.hour).round
  end

end
