Rails.application.routes.draw do

  # This is the route to get an email notification to mandrill from mailchimp
  post 'site_emails/bbsde21mqcrj95ji19si' => 'site_emails#create'
  get 'site_emails/bbsde21mqcrj95ji19si' => 'site_emails#create'

  namespace :admin do
  get 'reports/unprocessed_tweets'
  end

  get 'verified_accounts/index'

  namespace :admin do
  get 'export/leads'
  end

  namespace :dashboard do
  get 'lead_streams/index'
  end

  get 'user_guides/keywords'

  get 'user_guides/replies'
  get 'user_guides' => "user_guides#all"

  get 'restaurants' => 'pages#restaurants'
  get 'agencies' => 'pages#social_media'
  get 'real_estate' => 'pages#real_estate'
  get '/pages' => 'pages#index'
  get '/pages_b' => 'pages#index_b'

  get 'food_delivery' => 'food_delivery#index'



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
    root 'lead_streams#index'
    resources :lead_streams
    get 'lead_streams/new'
    post 'lead_streams' => 'lead_streams#create'
    get 'lead_streams/:id/edit' => "lead_streams#edit"
    patch 'lead_streams/:id' => "lead_streams#update"
    put 'lead_streams/:id' => "lead_streams#update"
    get 'lead_streams/get_keywords/:id' => "lead_streams#get_keywords"
    get 'initial_setups/index'
    post '/initial_setups/add_city' => 'initial_setups#add_city'
    post '/initial_setups/add_category' => 'initial_setups#add_category'
    get '/initial_setups/set_status' => 'initial_setups#set_status'
    get 'leads/:stream_id' => 'leads#index'
    post 'leads/send_reply'
    get 'configurations/twitter_accounts'
    get 'configurations/lead_streams'
    get 'account' => 'account#index'
    get 'account/plan' => 'account#plan'
    post '/initial_setups/create_lead_stream' =>'initial_setups#create_lead_stream'
    get '/initial_setups/connect_twitter' =>'initial_setups#connect_twitter'
    post 'leads/mark_non_lead'
    get 'keyword' => 'keyword#index'
    post 'keyword/remove'
    post 'keyword/add'
  end

  namespace :admin do
    root 'users#index'
    get 'dashboard/index'
    get 'leads/add'
    get 'leads/push'
    get 'leads/:lead_stream_id' => "leads#index"
    get 'users' => 'users#index'
    get 'lead_streams/:user_id' => 'lead_streams#index'
    get 'users/all' => 'users#all'
    get 'users/leads/:keyword_id' => 'users#leads'
    get 'users/lead_streams/:id' => 'users#lead_stream'
    get 'users/lead_streams/keywords/:id' => 'users#keyword_tweets'
    post 'users/lead_streams/keywords' => 'users#new_keyword'
    post 'users/set_unprocessed_tweet_type' => 'users#set_unprocessed_tweet_type'
    get 'sample_data/categories'
    get 'sample_data/categories/:id' => 'sample_data#tweets'
    post '/sample_category/create' => 'sample_data#create_category'
    post '/sample_lead/create' => 'sample_data#create_lead'
    post 'users/set_sample_category' => 'users#set_sample_category'
    get 'leads/qc/:keyword_id' => "leads#qc"
    get 'leads/qc_stream/:lead_stream_id' => "leads#qc_stream"
    get 'keyword_tracker/index'
    post 'users/set_not_working_keyword' => 'users#set_not_working_keyword'
    get 'angular_admin/users'
    get 'angular_admin/all_users'
    get 'angular_admin/keywords'
    get 'angular_admin/all_keywords'
  end

  get 'auth/:provider/callback', to: 'sessions#create'


  #devise_for :users

  devise_for :users, :controllers => { :registrations => "registrations" }




  #get 'home/index'
  root 'pages#index'
  get "/about" => "home#about"
  get "/contact" => "home#contact"

  get 'policies/terms_and_conditions'

  get 'policies/privacy_policy'

  get 'subscriptions/show'




end
