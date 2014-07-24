class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    'https://urbanzeak.recurly.com/subscribe/pro'
  end
end