
class Dashboard::LeadsController < Dashboard::ApplicationController
  def index

    if current_user.authorized_application == true
      @leads = UserLead.where(:user_id => current_user.id).order("created_at desc")
    else
      @application_not_authorized = true
    end


  end
end
