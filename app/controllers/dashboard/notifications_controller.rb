class Dashboard::NotificationsController < ApplicationController
  def create

  end

  def archive

    notification = Notification.find(params[:notification_id])
    notification.archived = true

    respond_to do |format|
      if notification.save
        format.json { render :json => notification, status: :created }
      else
        format.json { render :json => notification.errors, status: 500 }
      end
    end
  end

  def set_user_website

    current_user.website = params[:website]

    respond_to do |format|
      if current_user.save
        format.json { render :json => current_user, status: :created }
      else
        format.json { render :json => current_user.errors, status: 500 }
      end
    end
  end

end
