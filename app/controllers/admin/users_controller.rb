class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all
  end

  def all
    @users = User.all
  end

end
