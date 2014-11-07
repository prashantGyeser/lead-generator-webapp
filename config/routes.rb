Rails.application.routes.draw do

  get 'restaurants' => 'pages#restaurants'
  get 'agencies' => 'pages#social_media'

  get 'food_delivery' => 'food_delivery#index'

  get 'eerfzfckilwswwiw/index'

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      post 'leads/batch_create'
    end
  end

  namespace :dashboard do
  get 'todays_leads' => 'todays_leads#index'
  post 'todays_leads/send_reply'
  end

  namespace :dashboard do
  get 'account/index'
  end

  namespace :dashboard do
  get 'twitter_accounts/index'
  end

  namespace :dashboard do
  get 'reports/index'
  end

  resources :lead_streams

  namespace :dashboard do
    root 'reports#index'
    get 'initial_setups/index'
    post '/initial_setups/add_city' => 'initial_setups#add_city'
    post '/initial_setups/add_category' => 'initial_setups#add_category'
    get '/initial_setups/set_status' => 'initial_setups#set_status'
    get 'leads/:stream_id' => 'leads#index'
    post 'leads/send_reply'
    get 'configurations/twitter_accounts'
    get 'configurations/lead_streams'
    get 'account' => 'account#index'
  end

  get 'auth/:provider/callback', to: 'sessions#create'


  devise_for :users, :controllers => { :registrations => "registrations" }
  namespace :admin do
    root 'dashboard#index'
    get 'dashboard/index'
    get 'leads/add'
    get 'leads/push'
    get 'users' => 'users#index'
    get 'lead_streams' => 'lead_streams#index'
    get 'users/all' => 'users#all'
  end



  #get 'home/index'
  root 'home#index'
  get "/about" => "home#about"
  get "/contact" => "home#contact"

  get 'policies/terms_and_conditions'

  get 'policies/privacy_policy'

  get 'subscriptions/show'

end
