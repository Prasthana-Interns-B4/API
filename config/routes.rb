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
      member do
        put 'assign'
        put  'unassign'
      end
    end
  end

  scope module: :v1 do
    resources :users do
      post '/create_employee',to:'users#create', on: :collection
      get 'pending',to:'users#pending', on: :collection
      member do
        put 'approve'
        delete 'reject',to:'users#destroy'
      end
    end

  end
end

