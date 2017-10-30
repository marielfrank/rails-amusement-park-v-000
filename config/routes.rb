Rails.application.routes.draw do
    root to: 'welcome#home'
    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'
    delete '/signout' => 'sessions#destroy'
    post '/rides/new' => 'rides#create'
    resources :users, only: [:new, :create, :show]
    resources :sessions, only: [:new, :create, :destroy]
    resources :attractions
end