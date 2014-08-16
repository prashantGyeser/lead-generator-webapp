class Dashboard::InitialSetupsController < Dashboard::ApplicationController
  def index
    session[:user_id] = current_user.id
    @user_city = UserCity.new
  end

  def add_city
    city_id = params[:city][:id]

    if city_id.empty?

    else
      @user_city = UserCity.new(user_id: current_user.id, city_id: city_id)

      if @user_city.save
        #set flash[:success] to "Todo added successfully"
        flash[:success] = "Updated your city preference"
        render :index
      else
        flash[:error] = @user_city.errors.full_messages.join("<br>").html_safe
        render :index
      end


    end


  end

end
