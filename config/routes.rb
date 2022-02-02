Rails.application.routes.draw do
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  get '/users/all', to: 'users#index'
  get '/users/:id(.:format)', to: 'users#show'
  resources :adverts do
    resources :comments
  end
  resources :categories
  # resources :users
end
