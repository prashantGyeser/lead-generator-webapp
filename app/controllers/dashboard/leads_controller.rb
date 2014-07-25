
class Dashboard::LeadsController < Dashboard::ApplicationController
  def index
    @leads = UserLead.where(:user_id => current_user.id).order("created_at desc")
  end
end
