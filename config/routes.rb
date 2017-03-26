Rails.application.routes.draw do

  root :to=> 'employers/:id', to: 'employers#show'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'employers#new'
  post '/employers' => 'employers#create'
  get '/employers' =>'employers#show'

  resources :employers do
    member do
      get :confirm_email
    end
  end
  get "/phone_verify" => 'phone_verify#new', as: 'new_phone_verify'
  put '/phone_verify' => 'phone_verify#update', as: 'phone_verify'
  post '/phone_verify' => 'phone_verify#create', as: 'resend_phone_verify'
  post '/phone_verify/verify_email' => 'phone_verify#verify_email', as: 'verify_email'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
