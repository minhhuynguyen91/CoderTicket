Rails.application.routes.draw do

  root 'events#index'
  resources :users, :only => [:new, :create]
  
  get  'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'auth/:provider/callback' => 'sessions#callback'
  
  delete 'signout' => 'sessions#destroy'


  resources :ticket_types, only: [:new, :create]
  
  resources :events do
    collection do
      get 'mines' => 'events#event_list'
      post 'publish' => 'events#publish'
    end
    resources :tickets
  end

end
