class Dashboard::AccountController < Dashboard::ApplicationController
  def index
    if Subscription.exists?(user_id: current_user.id)
      @subscription = Subscription.where(user_id: current_user.id).last
    end
  end

  def plan

  end

end
