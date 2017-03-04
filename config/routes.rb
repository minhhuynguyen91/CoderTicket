Rails.application.routes.draw do

  get 'ownerships/create'

  get 'ownerships/destroy'

  root 'events#index'
  resources :users, :only => [:new, :create, :show]
  
  #Sessions controller
  get  'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'auth/:provider/callback' => 'sessions#callback'  
  delete 'signout' => 'sessions#destroy'

  resources :ticket_types, :only => [:new, :create]
  
  #resources :tickets, :only => [:new, :create]

  resources :events do
    resources :tickets, :only => [:new, :create]
    collection do
      get 'mines' => 'events#event_list'
      post 'publish' => 'events#publish'

      post 'add_owner' => 'ownerships#create'
      delete 'remove_owner' => 'ownerships#destroy'
    end
  end

end
