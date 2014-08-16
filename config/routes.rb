Rails.application.routes.draw do

  namespace :dashboard do
    get 'initial_setups/index'
    post '/initial_setups/add_city' => 'initial_setups#add_city'
    post '/initial_setups/add_category' => 'initial_setups#add_category'
  end

  namespace :dashboard do
    root 'leads#index'
    get 'leads/index'
  end

  get 'auth/:provider/callback', to: 'sessions#create'


  namespace :admin do
  get 'dashboard/index'
  end

  devise_for :users, :controllers => { :registrations => "registrations" }
  namespace :admin do
  get 'leads/add'
  get 'leads/push'
  end



  #get 'home/index'
  root 'home#index'
  get "/about" => "home#about"
  get "/contact" => "home#contact"

  get 'policies/terms_and_conditions'

  get 'policies/privacy_policy'

  get 'subscriptions/show'

end
