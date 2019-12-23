Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'users#new'
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/edit-basic-info/:id', to: 'users#edit_basic_info', as: :basic_info
  patch 'update-basic-info', to: 'users#update_basic_info'
  get 'users/:id/attendances/:date/edit', to: 'attendances#edit', as: :edit_attendances
  patch 'users/:id/attendances/:date/update', to: 'attendances#update', as: :update_attendances
  
  resources :users do
    # get 'attendances/edit_one_month' # この行が追加対象です。
    # patch 'attendances/update_one_month' # この行が追加対象です。
    # member do
    #   get 'edit_basic_info'
    #   patch 'update_basic_info'
    #   get 'attendances/edit_one_month' # この行が追加対象です。
    # end
    # resources :attendances, only: :update
      resources :attendances, only: :create
  end
end