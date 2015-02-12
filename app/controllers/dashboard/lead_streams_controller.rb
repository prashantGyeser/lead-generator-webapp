class Dashboard::LeadStreamsController < Dashboard::ApplicationController
  def index

    @lead_streams = LeadStream.where(user_id: current_user.id)

  end

  def new
    @lead_stream = LeadStream.new
    3.times {@lead_stream.keywords.build}
  end

  def create

    @lead_stream = LeadStream.new(lead_stream_params)
    @lead_stream.user_id = current_user.id

    gecoding_error = false

    begin
      lat_lon = Geocoder.coordinates(params[:lead_stream][:city_name])
      @lead_stream.latitude = lat_lon[0]
      @lead_stream.longitude = lat_lon[1]
    rescue
      puts "Could not find the coordinates of the given city"
      gecoding_error = true
    end

    #gecoding_error = true

    respond_to do |format|

      if gecoding_error == true || lat_lon.nil?
        flash[:error] = "We could not find your city! Did you misspell it?"
        #flash[:error] = "The gecode info is: #{gecoding_error} and the lat_lon is: #{lat_lon.inspect}"
        format.html { redirect_to dashboard_root_path }
      else
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

  end


  private
  def lead_stream_params
    params.require(:lead_stream).permit(:city_name, :name, {keywords_attributes: [:term]})
  end

end
