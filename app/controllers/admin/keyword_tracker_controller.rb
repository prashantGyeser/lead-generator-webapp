class Admin::KeywordTrackerController < Admin::ApplicationController
  def index
    @keywords = Keyword.all
  end
end
