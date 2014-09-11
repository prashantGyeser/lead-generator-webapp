Rails.application.routes.draw do

  namespace :dashboard do
  get 'reports/index'
  end

  resources :lead_streams

  namespace :dashboard do
    root 'reports#index'
    get 'initial_setups/index'
    post '/initial_setups/add_city' => 'initial_setups#add_city'
    post '/initial_setups/add_category' => 'initial_setups#add_category'
    post '/initial_setups/set_status' => 'initial_setups#set_status'
    get 'leads/:stream_id' => 'leads#index'
    post 'leads/send_reply'
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
