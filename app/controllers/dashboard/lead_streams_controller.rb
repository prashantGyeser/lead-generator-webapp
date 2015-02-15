class Dashboard::LeadStreamsController < Dashboard::ApplicationController

  before_action :set_lead_stream, only: [:edit, :update]

  def index

    @lead_streams = LeadStream.where(user_id: current_user.id)
    @lead_streams.count >= current_user.total_streams ? (@max_reached = true):(@max_reached = false)

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
          format.html { redirect_to dashboard_root_path }
        else
          flash[:error] = "Two streams cannot have the same city and category"
          format.html { render :new }
          format.json { render json: @lead_stream.errors, status: :unprocessable_entity }
        end
      end

    end

  end

  def edit
  end

  def update
    respond_to do |format|
      if @lead_stream.update(lead_stream_params)
        format.html { redirect_to dashboard_root_path, notice: 'Lead Stream was successfully updated.' }
        format.json { render :index, status: :ok, location: @lead_stream }
      else
        format.html { render :edit }
        format.json { render json: @lead_stream.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def set_lead_stream
    @lead_stream = LeadStream.find(params[:id])
  end

  def lead_stream_params
    params.require(:lead_stream).permit(:city_name, :name, {keywords_attributes: [:term, :id]})
  end

end
