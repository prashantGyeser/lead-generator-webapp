class Dashboard::InitialSetupsController < Dashboard::ApplicationController

  layout 'setup/application'

  def index
    @lead_stream = LeadStream.new
    3.times {@lead_stream.keywords.build}
  end

  def create_lead_stream

    @lead_stream = LeadStream.new(lead_stream_params)
    @lead_stream.user_id = current_user.id

    begin
      lat_lon = Geocoder.coordinates(params[:city_name])
      @lead_stream.latitude = lat_lon[0]
      @lead_stream.longitude = lat_lon[1]
    rescue
      puts "Could not find the coordinates of the given city"
    end

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


  def connect_twitter
    session[:user_id] = current_user.id
  end


  private
  def lead_stream_params
    params.require(:lead_stream).permit(:city_name, keywords_attributes: [:term])
  end


end
