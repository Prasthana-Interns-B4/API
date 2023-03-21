Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

  scope module: :v1 do
    resources :devices do
    get 'search' => 'devices#search',on: :collection
    end
  end


  scope module: :v1 do
    resources :users do
      member do
        put 'approve', to:  "users#approve"
        put 'update_by_employee',to: "users#update"
        delete 'reject' ,to:"users#destroy"
      end
      post '/create_employee', to: 'users#create', on: :collection
      get '/profile', to: 'users#profile',on: :collection
    end
  end



end
