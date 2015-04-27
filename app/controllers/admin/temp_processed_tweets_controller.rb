class Admin::TempProcessedTweetsController < Admin::ApplicationController

  before_action :set_user

  def temp_leads
    @temp_leads = TempLead.where(keyword_id: @user_keyword_ids)
  end

  def temp_non_leads
    @temp_non_leads = TempNonLead.where(keyword_id: @user_keyword_ids)
  end

  private
  def set_user
    @user = User.find(params[:user_id])
    @user_keyword_ids = @user.get_keyword_ids
  end


end
