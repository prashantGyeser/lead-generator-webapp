class Admin::TempProcessedTweetsController < Admin::ApplicationController
  def temp_leads
    @temp_leads = TempLead.all
  end

  def temp_non_leads
    @temp_non_leads = TempNonLead.all
  end
end
