require 'setup_complete_send_user_to_processor'

class Dashboard::InitialSetupsController < Dashboard::ApplicationController
  def index
    session[:user_id] = current_user.id

    @lead_streams = LeadStream.where(user_id: current_user.id)
    lead_streams_available = User.find(current_user.id).total_streams

    @number_of_available_streams = lead_streams_available - @lead_streams.count

    @lead_stream = LeadStream.new

    @user_cities = UserCity.where(user_id: current_user.id)
    @user_categories = UserCategory.where(user_id: current_user.id)
    @user_tokens = Token.where(user_id: current_user.id)

    if ((@lead_streams.count == lead_streams_available || (@user_cities.count > 0 && @user_categories.count > 0)) && @user_tokens.count > 0)
      redirect_to dashboard_root_path
    else
      @user_city = UserCity.new
      @user_category = UserCategory.new
    end

  end

  def add_city
    city_id = params[:city][:id]

    if city_id.empty?
      flash[:error] = "You need to select a city"
      redirect_to dashboard_initial_setups_index_path
    else
      @user_city = UserCity.new(user_id: current_user.id, city_id: city_id)

      if @user_city.save
        flash[:success] = "Updated your city preference"

        SetupCompleteSendUserToProcessor.send_user_to_processor(current_user.id)

        redirect_to dashboard_initial_setups_index_path
      else
        flash[:error] = @user_city.errors.full_messages.join("<br>").html_safe
        redirect_to dashboard_initial_setups_index_path
      end
    end


  end


  def add_category
    category_id = params[:category][:id]

    if category_id.empty?
      flash[:error] = "You need to select a category"
      redirect_to dashboard_initial_setups_index_path
    else
      @user_category = UserCategory.new(user_id: current_user.id, category_id: category_id)
      if @user_category.save
        flash[:success] = "Updated your category preference"
        SetupCompleteSendUserToProcessor.send_user_to_processor(current_user.id)
        redirect_to dashboard_initial_setups_index_path
      else
        flash[:error] = @user_category.errors.full_messages.join("<br>").html_safe
        redirect_to dashboard_initial_setups_index_path
      end
    end

  end


end
