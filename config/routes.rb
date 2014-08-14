Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'

  get 'policies/terms_and_conditions'

  get 'policies/privacy_policy'

  get 'subscriptions/show'


  namespace :admin do
  get 'dashboard/index'
  end

  #get 'home/index'
  root 'home#index'

  devise_for :users, :controllers => { :registrations => "registrations" }
  namespace :admin do
  get 'leads/add'
  get 'leads/push'
  end

  namespace :dashboard do
    root 'leads#index'
    get 'leads/index'
  end

end
