class Dashboard::InitialSetupsController < Dashboard::ApplicationController

  layout 'setup/application'

  skip_before_filter :check_setup
  skip_before_filter :trial_expired?

  def index
    @lead_stream = LeadStream.new
    3.times {@lead_stream.keywords.build}

    #puts "The referre is: #{request.inspect}"

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


  def connect_twitter
    session[:user_id] = current_user.id
  end


  private
  def lead_stream_params
    params.require(:lead_stream).permit(:city_name, :name, :country_id, keywords_attributes: [:term])
  end


end
