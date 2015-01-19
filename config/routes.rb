Rails.application.routes.draw do
  
  root to: 'pages#homepage'

  get '/signup'  => 'users#new', as: :signup

  get '/login' => 'sessions#new', as: :login # get renders form
  post '/login' => 'sessions#create' # post submits the form

  get '/logout' => 'sessions#destroy', as: :logout # nillifies the session and sends user to login page

  get '/profile' => 'users#profile', as: :profile


  resources :users
  resources :schools
  resources :lists
  resources :user_safety_schools
  resources :user_target_schools
  resources :user_reach_schools

end
