Rails.application.routes.draw do

  root 'events#index'
  resources :users, :only => [:new, :create]
  resources :sessions, :only => [:new, :create, :destroy]
  resources :ticket_types, only: [:new, :create]
  
  resources :events do
    collection do
      get 'mines' => 'events#event_list'
      post 'publish' => 'events#publish'
    end
    resources :tickets
  end

end
